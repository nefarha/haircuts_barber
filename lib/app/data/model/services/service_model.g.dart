// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceModelImpl _$$ServiceModelImplFromJson(Map<String, dynamic> json) =>
    _$ServiceModelImpl(
      id: json['id'] as String,
      namaPaket: json['namaPaket'] as String,
      deskripsi: json['deskripsi'] as String,
      hargaPaket: json['hargaPaket'] as num,
    );

Map<String, dynamic> _$$ServiceModelImplToJson(_$ServiceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namaPaket': instance.namaPaket,
      'deskripsi': instance.deskripsi,
      'hargaPaket': instance.hargaPaket,
    };
