// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      cityId: json['city_id'] as String,
      provinceId: json['province_id'] as String,
      province: json['province'] as String,
      type: json['type'] as String,
      cityName: json['city_name'] as String,
      postalCode: json['postal_code'] as String,
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      'city_id': instance.cityId,
      'province_id': instance.provinceId,
      'province': instance.province,
      'type': instance.type,
      'city_name': instance.cityName,
      'postal_code': instance.postalCode,
    };
