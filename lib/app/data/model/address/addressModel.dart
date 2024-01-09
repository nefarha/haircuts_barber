// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'addressModel.freezed.dart';
part 'addressModel.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String alamat,
    required num lat,
    required num long,
    required String provinceId,
    required String provinceName,
    required String cityId,
    required String cityName,
    required String postalCode,
    required bool? pinpointed,
    required String description,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
