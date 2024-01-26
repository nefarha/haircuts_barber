import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/booking/booking_model.dart';

class BookingRepo {
  final _bookingStore =
      FirebaseFirestore.instance.collection('booking').withConverter(
            fromFirestore: (snapshot, options) =>
                BookingModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );

  Future<List<BookingModel>> getBookings() async {
    return await _bookingStore.get().then((value) => value.docs
        .map(
          (e) => e.data(),
        )
        .toList());
  }

  Future updateReminder(
      {required bool reminderValue, required String bookingId}) async {
    await _bookingStore.doc(bookingId).update({'isReminder': reminderValue});
  }

  Future changeStatusBooking(
      {required String bookingId, required STATUS_BOOKING newStatus}) async {
    await _bookingStore.doc(bookingId).update({'status': newStatus.name});
  }
}
