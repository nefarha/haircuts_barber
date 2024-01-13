// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      city_id: json['city_id'] as String,
      province_id: json['province_id'] as String,
      province: json['province'] as String,
      type: json['type'] as String,
      city_name: json['city_name'] as String,
      postal_code: json['postal_code'] as String,
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      'city_id': instance.city_id,
      'province_id': instance.province_id,
      'province': instance.province,
      'type': instance.type,
      'city_name': instance.city_name,
      'postal_code': instance.postal_code,
    };
