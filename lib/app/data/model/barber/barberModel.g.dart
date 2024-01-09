// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barberModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BarberModelImpl _$$BarberModelImplFromJson(Map<String, dynamic> json) =>
    _$BarberModelImpl(
      id: json['id'] as String,
      namaToko: json['namaToko'] as String,
      alamat: json['alamat'] as Map<String, dynamic>,
      rating: json['rating'] as num,
      ownerId: json['ownerId'] as String,
      deskripsiToko: json['deskripsiToko'] as String,
      daftarPaket: (json['daftarPaket'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      daftarGambar: json['daftarGambar'] as List<dynamic>,
      shopType: json['shopType'] as String?,
    );

Map<String, dynamic> _$$BarberModelImplToJson(_$BarberModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namaToko': instance.namaToko,
      'alamat': instance.alamat,
      'rating': instance.rating,
      'ownerId': instance.ownerId,
      'deskripsiToko': instance.deskripsiToko,
      'daftarPaket': instance.daftarPaket,
      'daftarGambar': instance.daftarGambar,
      'shopType': instance.shopType,
    };
