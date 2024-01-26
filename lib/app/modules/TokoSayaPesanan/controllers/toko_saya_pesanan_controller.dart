import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/booking/booking_model.dart';
import 'package:haircuts_barber_aja/app/data/model/booking/repo/booking_repository.dart';

class TokoSayaPesananController extends GetxController
    with StateMixin<List<BookingModel>> {
  var bookingRepo = BookingRepo();

  var selectedFilter = Rx(STATUS_BOOKING.UPCOMING);

  RxList<BookingModel> bookingList = RxList.empty();

  @override
  void onInit() async {
    bookingList.value = await bookingRepo.getBookings().then(
      (value) {
        if (value.isNotEmpty) {
          change(
            value,
            status: RxStatus.success(),
          );
        } else {
          change(value, status: RxStatus.empty());
        }
        return value;
      },
    );
    super.onInit();
  }
}
