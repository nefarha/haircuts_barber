import 'package:freezed_annotation/freezed_annotation.dart';

part 'userModel.freezed.dart';
part 'userModel.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String email,
    required String token,
    String? phone,
    String? profileUrl,
    num? balance,
    List? favourite,
    Map<String, dynamic>? addressModel,
    String? accountType,
    String? barberId,
  }) = _UserModel;

  factory UserModel.fromJson({required Map<String, dynamic> json}) =>
      _$UserModelFromJson(json);
}
