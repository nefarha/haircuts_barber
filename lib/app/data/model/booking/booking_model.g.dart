// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      id: json['id'] as String,
      bookerId: json['bookerId'] as String,
      bookerName: json['bookerName'] as String,
      bookerPicture: json['bookerPicture'] as String?,
      barberId: json['barberId'] as String,
      barberName: json['barberName'] as String,
      ownerId: json['ownerId'] as String,
      paketBarber:
          ServiceModel.fromJson(json['paketBarber'] as Map<String, dynamic>),
      tanggal: DateTime.parse(json['tanggal'] as String),
      jam: json['jam'] as String,
      tax: json['tax'] as num,
      totalPrice: json['totalPrice'] as num,
      status: json['status'] as String,
      paymentType: json['paymentType'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookerId': instance.bookerId,
      'bookerName': instance.bookerName,
      'bookerPicture': instance.bookerPicture,
      'barberId': instance.barberId,
      'barberName': instance.barberName,
      'ownerId': instance.ownerId,
      'paketBarber': instance.paketBarber.toJson(),
      'tanggal': instance.tanggal.toIso8601String(),
      'jam': instance.jam,
      'tax': instance.tax,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'paymentType': instance.paymentType,
      'createdAt': instance.createdAt.toIso8601String(),
    };
