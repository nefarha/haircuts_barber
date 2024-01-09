// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addressModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      alamat: json['alamat'] as String,
      lat: json['lat'] as num,
      long: json['long'] as num,
      provinceId: json['provinceId'] as String,
      provinceName: json['provinceName'] as String,
      cityId: json['cityId'] as String,
      cityName: json['cityName'] as String,
      postalCode: json['postalCode'] as String,
      pinpointed: json['pinpointed'] as bool?,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'alamat': instance.alamat,
      'lat': instance.lat,
      'long': instance.long,
      'provinceId': instance.provinceId,
      'provinceName': instance.provinceName,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'postalCode': instance.postalCode,
      'pinpointed': instance.pinpointed,
      'description': instance.description,
    };
