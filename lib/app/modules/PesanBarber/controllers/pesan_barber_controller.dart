import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/barberModel.dart';
import 'package:haircuts_barber_aja/app/data/model/booking/booking_model.dart';
import 'package:haircuts_barber_aja/app/data/model/services/service_model.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';

enum Payment { ONLINE, CASH }

class PesanBarberController extends GetxController {
  Rx<BarberModel> barberModel = Rx(Get.arguments);
  UserModel? get user => UserController.instance.user.value;

  Rx<ServiceModel> get selectedPaket => Rx(barberModel.value.daftarPaket.first);

  var selectedPayment = Payment.values.first.obs;
  var selectedDate = Rx(DateTime.now().add(const Duration(days: 1)));
  var selectedIndex = 0.obs;
  var selectedTime = Rxn<int>(10);

  proceedPay() {
    BookingModel bookingModel = BookingModel(
      id: "${barberModel.value.id}_${DateTime.now()}",
      booker: user!,
      bookerPicture: user!.profileUrl,
      barberStore: barberModel.value,
      ownerId: barberModel.value.ownerId,
      paketBarber: selectedPaket.value,
      tanggal: selectedDate.value
          .copyWith(hour: selectedTime.value, minute: 0, second: 0),
      jam: selectedTime.string,
      tax: (selectedPaket.value.hargaPaket * 0.1),
      totalPrice: selectedPaket.value.hargaPaket +
          (selectedPaket.value.hargaPaket * 0.1),
      status: STATUS_BOOKING.UPCOMING.name,
      isReminder: false,
      paymentType: selectedPayment.value.name,
      createdAt: DateTime.now(),
    );

    Get.toNamed(Routes.CHECKOUT, arguments: bookingModel);
  }
}
