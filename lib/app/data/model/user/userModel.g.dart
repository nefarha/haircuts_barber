// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      phone: json['phone'] as String?,
      profileUrl: json['profileUrl'] as String?,
      balance: json['balance'] as num?,
      favourite: json['favourite'] as List<dynamic>?,
      addressModel: json['addressModel'] as Map<String, dynamic>?,
      accountType: json['accountType'] as String?,
      barberId: json['barberId'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'token': instance.token,
      'phone': instance.phone,
      'profileUrl': instance.profileUrl,
      'balance': instance.balance,
      'favourite': instance.favourite,
      'addressModel': instance.addressModel,
      'accountType': instance.accountType,
      'barberId': instance.barberId,
    };
