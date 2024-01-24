// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostPaymentModelImpl _$$PostPaymentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PostPaymentModelImpl(
      title: json['title'] as String,
      type: json['type'] as String,
      amount: json['amount'] as num,
      expired_date: json['expired_date'] as String,
      step: json['step'] as num,
      sender_name: json['sender_name'] as String,
      sender_email: json['sender_email'] as String,
    );

Map<String, dynamic> _$$PostPaymentModelImplToJson(
        _$PostPaymentModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'amount': instance.amount,
      'expired_date': instance.expired_date,
      'step': instance.step,
      'sender_name': instance.sender_name,
      'sender_email': instance.sender_email,
    };
