import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/booking/booking_model.dart';
import 'package:haircuts_barber_aja/app/data/model/payment/payment_model.dart';
import 'package:haircuts_barber_aja/app/data/model/payment/post_payment_model.dart';
import 'package:haircuts_barber_aja/app/data/model/payment/repo/payment_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';
import 'package:haircuts_barber_aja/app/data/services/flip_gateway/flip_gateway.dart';
import 'package:intl/intl.dart';

class CheckoutController extends GetxController {
  BookingModel bookingModel = Get.arguments;
  UserModel? get user => UserController.instance.user.value;
  var paymentRepo = PaymentRepo();
  var flipGateway = FlipGateway();

  var isLoading = false.obs;

  Future createBill() async {
    updateLoading(currentValue: isLoading, newValue: true);
    try {
      PostPaymentModel postPaymentModel = PostPaymentModel(
          title: "${bookingModel.barberName}_order_${DateTime.now()}",
          type: "MULTIPLE",
          amount: bookingModel.totalPrice.toInt(),
          expired_date: DateFormat("yyyy-MM-dd HH:mm").format(
            DateTime.now().add(
              const Duration(days: 1),
            ),
          ),
          step: 2,
          sender_name: user!.name,
          sender_email: user!.email);
      var a = await flipGateway.createBill(postPaymentModel: postPaymentModel);
      print(a);
      await flipGateway.createBill(postPaymentModel: postPaymentModel).then(
        (value) async {
          if (value != null) {
            var paymentModel = PaymentModel(
              userId: user!.id,
              link_id: value.data['link_id'],
              link_url: value.data['link_url'],
              title: value.data['title'],
              type: value.data['type'],
              amount: value.data['amount'],
              expired_date: value.data['expired_date'],
              status: value.data['status'],
              is_address_required: value.data['is_address_required'],
              is_phone_number_required: value.data['is_phone_number_required'],
              step: value.data['step'],
              customer: value.data['customer'],
              paymentType: "BOOKING",
              bookingModel: bookingModel,
            );

            await paymentRepo.addPaymentToDatabase(paymentModel: paymentModel);

            updateLoading(currentValue: isLoading, newValue: true);
            Get.until((route) => route.isFirst);
          } else {
            updateLoading(currentValue: isLoading, newValue: false);
            buildErrorDialog(message: "Value Data is NUll, somethings wrong");
          }
        },
      );
    } catch (e) {
      updateLoading(currentValue: isLoading, newValue: false);
      buildErrorDialog(message: 'Somethings Wrong');
    }
  }
}
