import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haircuts_barber_aja/app/data/model/booking/booking_model.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required String userId,
    required int link_id,
    required String link_url,
    required String title,
    required String type,
    required int amount,
    required String expired_date,
    required String status,
    required int is_address_required,
    required int is_phone_number_required,
    required int step,
    required Map customer,
    required String paymentType,
    required DateTime createdAt,
    required BookingModel? bookingModel,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}
