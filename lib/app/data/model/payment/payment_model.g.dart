// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      userId: json['userId'] as String,
      link_id: json['link_id'] as int,
      link_url: json['link_url'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      amount: json['amount'] as int,
      expired_date: json['expired_date'] as String,
      status: json['status'] as String,
      is_address_required: json['is_address_required'] as int,
      is_phone_number_required: json['is_phone_number_required'] as int,
      step: json['step'] as int,
      customer: json['customer'] as Map<String, dynamic>,
      paymentType: json['paymentType'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      bookingModel: json['bookingModel'] == null
          ? null
          : BookingModel.fromJson(json['bookingModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'link_id': instance.link_id,
      'link_url': instance.link_url,
      'title': instance.title,
      'type': instance.type,
      'amount': instance.amount,
      'expired_date': instance.expired_date,
      'status': instance.status,
      'is_address_required': instance.is_address_required,
      'is_phone_number_required': instance.is_phone_number_required,
      'step': instance.step,
      'customer': instance.customer,
      'paymentType': instance.paymentType,
      'createdAt': instance.createdAt.toIso8601String(),
      'bookingModel': instance.bookingModel?.toJson(),
    };
