import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/booking/booking_model.dart';
import 'package:haircuts_barber_aja/app/data/model/booking/repo/booking_repository.dart';

class TokoSayaPesananController extends GetxController
    with StateMixin<List<BookingModel>> {
  var bookingRepo = BookingRepo();

  var selectedFilter = Rx(STATUS_BOOKING.UPCOMING);
  var isLoading = false.obs;

  RxList<BookingModel> bookingList = RxList.empty();

  Future changeReminder({required BookingModel model}) async {
    updateLoading(currentValue: isLoading, newValue: true);
    if (model.isReminder == null || model.isReminder == false) {
      await bookingRepo.updateReminder(
          reminderValue: true, bookingId: model.id);
    } else {
      await bookingRepo.updateReminder(
          reminderValue: false, bookingId: model.id);
    }
    await updateList();
    updateLoading(currentValue: isLoading, newValue: false);
  }

  Future updateList() async {
    bookingList.value = await bookingRepo.getBookings();
  }

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
