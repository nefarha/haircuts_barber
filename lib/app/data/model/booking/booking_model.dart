import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haircuts_barber_aja/app/data/model/services/service_model.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
class BookingModel with _$BookingModel {
  const factory BookingModel({
    required String id,
    required String bookerId,
    required String bookerName,
    required String? bookerPicture,
    required String barberId,
    required String barberName,
    required String ownerId,
    required ServiceModel paketBarber,
    required DateTime tanggal,
    required String jam,
    required num tax,
    required num totalPrice,
    required String status,
    required String paymentType,
    required DateTime createdAt,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}
