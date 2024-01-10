// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      cityId: json['cityId'] as String,
      provinceId: json['provinceId'] as String,
      province: json['province'] as String,
      type: json['type'] as String,
      cityName: json['cityName'] as String,
      postalCode: json['postalCode'] as String,
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      'cityId': instance.cityId,
      'provinceId': instance.provinceId,
      'province': instance.province,
      'type': instance.type,
      'cityName': instance.cityName,
      'postalCode': instance.postalCode,
    };
