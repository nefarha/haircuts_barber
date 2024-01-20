// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testimonial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestiMonialModelImpl _$$TestiMonialModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TestiMonialModelImpl(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      ownerName: json['ownerName'] as String,
      barberId: json['barberId'] as String,
      ownerProfile: json['ownerProfile'] as String?,
      rating: json['rating'] as num,
      text: json['text'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TestiMonialModelImplToJson(
        _$TestiMonialModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'ownerName': instance.ownerName,
      'barberId': instance.barberId,
      'ownerProfile': instance.ownerProfile,
      'rating': instance.rating,
      'text': instance.text,
      'createdAt': instance.createdAt.toIso8601String(),
    };
