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
      province: json['province'] as Map<String, dynamic>,
      city: json['city'] as Map<String, dynamic>,
      pinpointed: json['pinpointed'] as bool?,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'alamat': instance.alamat,
      'lat': instance.lat,
      'long': instance.long,
      'province': instance.province,
      'city': instance.city,
      'pinpointed': instance.pinpointed,
      'description': instance.description,
    };
