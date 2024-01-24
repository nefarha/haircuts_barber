import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/payment/payment_model.dart';
import 'package:haircuts_barber_aja/app/data/model/payment/repo/payment_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';

class HistoryPembayaranController extends GetxController
    with StateMixin<List<PaymentModel>> {
  UserModel? get user => UserController.instance.user.value;
  final paymentRepo = PaymentRepo();

  final selectedStatus = Rx<STATUS_PAYMENT>(STATUS_PAYMENT.ACTIVE);

  RxList<PaymentModel> paymentList = RxList.empty();

  pickFilter({required STATUS_PAYMENT status}) {
    selectedStatus.value = status;
  }

  @override
  void onInit() async {
    paymentList.value = await paymentRepo.getPayments(userId: user!.id).then(
      (value) {
        if (value.length == 0) {
          change(value, status: RxStatus.empty());
        } else {
          change(value, status: RxStatus.success());
        }
        return value;
      },
    );
    super.onInit();
  }
}
