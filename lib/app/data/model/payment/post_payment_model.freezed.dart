// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostPaymentModel _$PostPaymentModelFromJson(Map<String, dynamic> json) {
  return _PostPaymentModel.fromJson(json);
}

/// @nodoc
mixin _$PostPaymentModel {
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  String get expired_date => throw _privateConstructorUsedError;
  num get step => throw _privateConstructorUsedError;
  String get sender_name => throw _privateConstructorUsedError;
  String get sender_email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostPaymentModelCopyWith<PostPaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostPaymentModelCopyWith<$Res> {
  factory $PostPaymentModelCopyWith(
          PostPaymentModel value, $Res Function(PostPaymentModel) then) =
      _$PostPaymentModelCopyWithImpl<$Res, PostPaymentModel>;
  @useResult
  $Res call(
      {String title,
      String type,
      num amount,
      String expired_date,
      num step,
      String sender_name,
      String sender_email});
}

/// @nodoc
class _$PostPaymentModelCopyWithImpl<$Res, $Val extends PostPaymentModel>
    implements $PostPaymentModelCopyWith<$Res> {
  _$PostPaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = null,
    Object? amount = null,
    Object? expired_date = null,
    Object? step = null,
    Object? sender_name = null,
    Object? sender_email = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      expired_date: null == expired_date
          ? _value.expired_date
          : expired_date // ignore: cast_nullable_to_non_nullable
              as String,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as num,
      sender_name: null == sender_name
          ? _value.sender_name
          : sender_name // ignore: cast_nullable_to_non_nullable
              as String,
      sender_email: null == sender_email
          ? _value.sender_email
          : sender_email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostPaymentModelImplCopyWith<$Res>
    implements $PostPaymentModelCopyWith<$Res> {
  factory _$$PostPaymentModelImplCopyWith(_$PostPaymentModelImpl value,
          $Res Function(_$PostPaymentModelImpl) then) =
      __$$PostPaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String type,
      num amount,
      String expired_date,
      num step,
      String sender_name,
      String sender_email});
}

/// @nodoc
class __$$PostPaymentModelImplCopyWithImpl<$Res>
    extends _$PostPaymentModelCopyWithImpl<$Res, _$PostPaymentModelImpl>
    implements _$$PostPaymentModelImplCopyWith<$Res> {
  __$$PostPaymentModelImplCopyWithImpl(_$PostPaymentModelImpl _value,
      $Res Function(_$PostPaymentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? type = null,
    Object? amount = null,
    Object? expired_date = null,
    Object? step = null,
    Object? sender_name = null,
    Object? sender_email = null,
  }) {
    return _then(_$PostPaymentModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      expired_date: null == expired_date
          ? _value.expired_date
          : expired_date // ignore: cast_nullable_to_non_nullable
              as String,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as num,
      sender_name: null == sender_name
          ? _value.sender_name
          : sender_name // ignore: cast_nullable_to_non_nullable
              as String,
      sender_email: null == sender_email
          ? _value.sender_email
          : sender_email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostPaymentModelImpl implements _PostPaymentModel {
  const _$PostPaymentModelImpl(
      {required this.title,
      required this.type,
      required this.amount,
      required this.expired_date,
      required this.step,
      required this.sender_name,
      required this.sender_email});

  factory _$PostPaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostPaymentModelImplFromJson(json);

  @override
  final String title;
  @override
  final String type;
  @override
  final num amount;
  @override
  final String expired_date;
  @override
  final num step;
  @override
  final String sender_name;
  @override
  final String sender_email;

  @override
  String toString() {
    return 'PostPaymentModel(title: $title, type: $type, amount: $amount, expired_date: $expired_date, step: $step, sender_name: $sender_name, sender_email: $sender_email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostPaymentModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.expired_date, expired_date) ||
                other.expired_date == expired_date) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.sender_name, sender_name) ||
                other.sender_name == sender_name) &&
            (identical(other.sender_email, sender_email) ||
                other.sender_email == sender_email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, type, amount,
      expired_date, step, sender_name, sender_email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostPaymentModelImplCopyWith<_$PostPaymentModelImpl> get copyWith =>
      __$$PostPaymentModelImplCopyWithImpl<_$PostPaymentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostPaymentModelImplToJson(
      this,
    );
  }
}

abstract class _PostPaymentModel implements PostPaymentModel {
  const factory _PostPaymentModel(
      {required final String title,
      required final String type,
      required final num amount,
      required final String expired_date,
      required final num step,
      required final String sender_name,
      required final String sender_email}) = _$PostPaymentModelImpl;

  factory _PostPaymentModel.fromJson(Map<String, dynamic> json) =
      _$PostPaymentModelImpl.fromJson;

  @override
  String get title;
  @override
  String get type;
  @override
  num get amount;
  @override
  String get expired_date;
  @override
  num get step;
  @override
  String get sender_name;
  @override
  String get sender_email;
  @override
  @JsonKey(ignore: true)
  _$$PostPaymentModelImplCopyWith<_$PostPaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
