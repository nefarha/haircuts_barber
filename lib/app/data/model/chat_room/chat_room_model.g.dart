// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomModelImpl _$$ChatRoomModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatRoomModelImpl(
      id: json['id'] as String,
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
      lastChat: json['lastChat'] == null
          ? null
          : ChatModel.fromJson(json['lastChat'] as Map<String, dynamic>),
      peopleInChat: (json['peopleInChat'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ChatRoomModelImplToJson(_$ChatRoomModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastUpdate': instance.lastUpdate.toIso8601String(),
      'lastChat': instance.lastChat?.toJson(),
      'peopleInChat': instance.peopleInChat,
    };
