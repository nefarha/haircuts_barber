// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'testimonial.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestiMonialModel _$TestiMonialModelFromJson(Map<String, dynamic> json) {
  return _TestiMonialModel.fromJson(json);
}

/// @nodoc
mixin _$TestiMonialModel {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get ownerName => throw _privateConstructorUsedError;
  String get barberId => throw _privateConstructorUsedError;
  String? get ownerProfile => throw _privateConstructorUsedError;
  num get rating => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestiMonialModelCopyWith<TestiMonialModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestiMonialModelCopyWith<$Res> {
  factory $TestiMonialModelCopyWith(
          TestiMonialModel value, $Res Function(TestiMonialModel) then) =
      _$TestiMonialModelCopyWithImpl<$Res, TestiMonialModel>;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String ownerName,
      String barberId,
      String? ownerProfile,
      num rating,
      String text,
      DateTime createdAt});
}

/// @nodoc
class _$TestiMonialModelCopyWithImpl<$Res, $Val extends TestiMonialModel>
    implements $TestiMonialModelCopyWith<$Res> {
  _$TestiMonialModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? ownerName = null,
    Object? barberId = null,
    Object? ownerProfile = freezed,
    Object? rating = null,
    Object? text = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      barberId: null == barberId
          ? _value.barberId
          : barberId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerProfile: freezed == ownerProfile
          ? _value.ownerProfile
          : ownerProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestiMonialModelImplCopyWith<$Res>
    implements $TestiMonialModelCopyWith<$Res> {
  factory _$$TestiMonialModelImplCopyWith(_$TestiMonialModelImpl value,
          $Res Function(_$TestiMonialModelImpl) then) =
      __$$TestiMonialModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String ownerName,
      String barberId,
      String? ownerProfile,
      num rating,
      String text,
      DateTime createdAt});
}

/// @nodoc
class __$$TestiMonialModelImplCopyWithImpl<$Res>
    extends _$TestiMonialModelCopyWithImpl<$Res, _$TestiMonialModelImpl>
    implements _$$TestiMonialModelImplCopyWith<$Res> {
  __$$TestiMonialModelImplCopyWithImpl(_$TestiMonialModelImpl _value,
      $Res Function(_$TestiMonialModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? ownerName = null,
    Object? barberId = null,
    Object? ownerProfile = freezed,
    Object? rating = null,
    Object? text = null,
    Object? createdAt = null,
  }) {
    return _then(_$TestiMonialModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      barberId: null == barberId
          ? _value.barberId
          : barberId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerProfile: freezed == ownerProfile
          ? _value.ownerProfile
          : ownerProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestiMonialModelImpl implements _TestiMonialModel {
  const _$TestiMonialModelImpl(
      {required this.id,
      required this.ownerId,
      required this.ownerName,
      required this.barberId,
      this.ownerProfile,
      required this.rating,
      required this.text,
      required this.createdAt});

  factory _$TestiMonialModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestiMonialModelImplFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String ownerName;
  @override
  final String barberId;
  @override
  final String? ownerProfile;
  @override
  final num rating;
  @override
  final String text;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'TestiMonialModel(id: $id, ownerId: $ownerId, ownerName: $ownerName, barberId: $barberId, ownerProfile: $ownerProfile, rating: $rating, text: $text, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestiMonialModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.barberId, barberId) ||
                other.barberId == barberId) &&
            (identical(other.ownerProfile, ownerProfile) ||
                other.ownerProfile == ownerProfile) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ownerId, ownerName, barberId,
      ownerProfile, rating, text, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestiMonialModelImplCopyWith<_$TestiMonialModelImpl> get copyWith =>
      __$$TestiMonialModelImplCopyWithImpl<_$TestiMonialModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestiMonialModelImplToJson(
      this,
    );
  }
}

abstract class _TestiMonialModel implements TestiMonialModel {
  const factory _TestiMonialModel(
      {required final String id,
      required final String ownerId,
      required final String ownerName,
      required final String barberId,
      final String? ownerProfile,
      required final num rating,
      required final String text,
      required final DateTime createdAt}) = _$TestiMonialModelImpl;

  factory _TestiMonialModel.fromJson(Map<String, dynamic> json) =
      _$TestiMonialModelImpl.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get ownerName;
  @override
  String get barberId;
  @override
  String? get ownerProfile;
  @override
  num get rating;
  @override
  String get text;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$TestiMonialModelImplCopyWith<_$TestiMonialModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
