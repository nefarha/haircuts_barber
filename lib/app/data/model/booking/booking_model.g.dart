// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      id: json['id'] as String,
      booker: UserModel.fromJson(json['booker'] as Map<String, dynamic>),
      bookerPicture: json['bookerPicture'] as String?,
      barberStore:
          BarberModel.fromJson(json['barberStore'] as Map<String, dynamic>),
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
      isReminder: json['isReminder'] as bool?,
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booker': instance.booker.toJson(),
      'bookerPicture': instance.bookerPicture,
      'barberStore': instance.barberStore.toJson(),
      'ownerId': instance.ownerId,
      'paketBarber': instance.paketBarber.toJson(),
      'tanggal': instance.tanggal.toIso8601String(),
      'jam': instance.jam,
      'tax': instance.tax,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'paymentType': instance.paymentType,
      'createdAt': instance.createdAt.toIso8601String(),
      'isReminder': instance.isReminder,
    };
