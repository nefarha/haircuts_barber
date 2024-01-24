import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_payment_model.freezed.dart';
part 'post_payment_model.g.dart';

@freezed
class PostPaymentModel with _$PostPaymentModel {
  const factory PostPaymentModel({
    required String title,
    required String type,
    required num amount,
    required String expired_date,
    required num step,
    required String sender_name,
    required String sender_email,
  }) = _PostPaymentModel;

  factory PostPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PostPaymentModelFromJson(json);
}
