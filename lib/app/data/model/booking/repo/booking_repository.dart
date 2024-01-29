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

  Future<List<BookingModel>> getBarberIncomingBooking(
      {required String barberId}) async {
    return await _bookingStore
        .where('barberStore.ownerId', isEqualTo: barberId)
        .get()
        .then((value) => value.docs
            .map(
              (e) => e.data(),
            )
            .toList());
  }

  Future<List<BookingModel>> getUserIncomingBooking(
      {required String userId}) async {
    return await _bookingStore
        .where('booker.id', isEqualTo: userId)
        .get()
        .then((value) => value.docs
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

  Future changeScheduleTime({required BookingModel bookingModel}) async {
    await _bookingStore.doc(bookingModel.id).update(bookingModel.toJson());
  }
}
