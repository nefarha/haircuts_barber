// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haircuts_barber_aja/app/data/model/city/city_model.dart';
import 'package:haircuts_barber_aja/app/data/model/province/province_model.dart';

part 'addressModel.freezed.dart';
part 'addressModel.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String alamat,
    required num lat,
    required num long,
    required ProvinceModel province,
    required CityModel city,
    required bool? pinpointed,
    required String description,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
