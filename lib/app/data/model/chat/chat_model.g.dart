// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      senderId: json['senderId'] as String,
      sendAt: DateTime.parse(json['sendAt'] as String),
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'senderId': instance.senderId,
      'sendAt': instance.sendAt.toIso8601String(),
      'isRead': instance.isRead,
    };
