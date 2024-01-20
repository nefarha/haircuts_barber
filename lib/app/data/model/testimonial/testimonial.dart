import 'package:freezed_annotation/freezed_annotation.dart';

part 'testimonial.freezed.dart';
part 'testimonial.g.dart';

@freezed
class TestiMonialModel with _$TestiMonialModel {
  const factory TestiMonialModel({
    required String id,
    required String ownerId,
    required String ownerName,
    required String barberId,
    String? ownerProfile,
    required num rating,
    required String text,
    required DateTime createdAt,
  }) = _TestiMonialModel;

  factory TestiMonialModel.fromJson({required Map<String, dynamic> json}) =>
      _$TestiMonialModelFromJson(json);
}
