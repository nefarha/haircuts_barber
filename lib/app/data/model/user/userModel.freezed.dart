// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get profileUrl => throw _privateConstructorUsedError;
  num? get balance => throw _privateConstructorUsedError;
  List<dynamic>? get favourite => throw _privateConstructorUsedError;
  AddressModel? get addressModel => throw _privateConstructorUsedError;
  String? get accountType => throw _privateConstructorUsedError;
  String? get barberId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String token,
      String? phone,
      String? profileUrl,
      num? balance,
      List<dynamic>? favourite,
      AddressModel? addressModel,
      String? accountType,
      String? barberId});

  $AddressModelCopyWith<$Res>? get addressModel;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? token = null,
    Object? phone = freezed,
    Object? profileUrl = freezed,
    Object? balance = freezed,
    Object? favourite = freezed,
    Object? addressModel = freezed,
    Object? accountType = freezed,
    Object? barberId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num?,
      favourite: freezed == favourite
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      addressModel: freezed == addressModel
          ? _value.addressModel
          : addressModel // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      barberId: freezed == barberId
          ? _value.barberId
          : barberId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get addressModel {
    if (_value.addressModel == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.addressModel!, (value) {
      return _then(_value.copyWith(addressModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String token,
      String? phone,
      String? profileUrl,
      num? balance,
      List<dynamic>? favourite,
      AddressModel? addressModel,
      String? accountType,
      String? barberId});

  @override
  $AddressModelCopyWith<$Res>? get addressModel;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? token = null,
    Object? phone = freezed,
    Object? profileUrl = freezed,
    Object? balance = freezed,
    Object? favourite = freezed,
    Object? addressModel = freezed,
    Object? accountType = freezed,
    Object? barberId = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num?,
      favourite: freezed == favourite
          ? _value._favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      addressModel: freezed == addressModel
          ? _value.addressModel
          : addressModel // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
      barberId: freezed == barberId
          ? _value.barberId
          : barberId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.token,
      this.phone,
      this.profileUrl,
      this.balance,
      final List<dynamic>? favourite,
      this.addressModel,
      this.accountType,
      this.barberId})
      : _favourite = favourite;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String token;
  @override
  final String? phone;
  @override
  final String? profileUrl;
  @override
  final num? balance;
  final List<dynamic>? _favourite;
  @override
  List<dynamic>? get favourite {
    final value = _favourite;
    if (value == null) return null;
    if (_favourite is EqualUnmodifiableListView) return _favourite;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AddressModel? addressModel;
  @override
  final String? accountType;
  @override
  final String? barberId;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, token: $token, phone: $phone, profileUrl: $profileUrl, balance: $balance, favourite: $favourite, addressModel: $addressModel, accountType: $accountType, barberId: $barberId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profileUrl, profileUrl) ||
                other.profileUrl == profileUrl) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            const DeepCollectionEquality()
                .equals(other._favourite, _favourite) &&
            (identical(other.addressModel, addressModel) ||
                other.addressModel == addressModel) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.barberId, barberId) ||
                other.barberId == barberId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      token,
      phone,
      profileUrl,
      balance,
      const DeepCollectionEquality().hash(_favourite),
      addressModel,
      accountType,
      barberId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String id,
      required final String name,
      required final String email,
      required final String token,
      final String? phone,
      final String? profileUrl,
      final num? balance,
      final List<dynamic>? favourite,
      final AddressModel? addressModel,
      final String? accountType,
      final String? barberId}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get token;
  @override
  String? get phone;
  @override
  String? get profileUrl;
  @override
  num? get balance;
  @override
  List<dynamic>? get favourite;
  @override
  AddressModel? get addressModel;
  @override
  String? get accountType;
  @override
  String? get barberId;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
