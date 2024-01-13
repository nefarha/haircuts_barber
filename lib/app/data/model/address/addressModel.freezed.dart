// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'addressModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  String get alamat => throw _privateConstructorUsedError;
  num get lat => throw _privateConstructorUsedError;
  num get long => throw _privateConstructorUsedError;
  ProvinceModel get province => throw _privateConstructorUsedError;
  CityModel get city => throw _privateConstructorUsedError;
  bool? get pinpointed => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res, AddressModel>;
  @useResult
  $Res call(
      {String alamat,
      num lat,
      num long,
      ProvinceModel province,
      CityModel city,
      bool? pinpointed,
      String description});

  $ProvinceModelCopyWith<$Res> get province;
  $CityModelCopyWith<$Res> get city;
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res, $Val extends AddressModel>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alamat = null,
    Object? lat = null,
    Object? long = null,
    Object? province = null,
    Object? city = null,
    Object? pinpointed = freezed,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as num,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as ProvinceModel,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityModel,
      pinpointed: freezed == pinpointed
          ? _value.pinpointed
          : pinpointed // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProvinceModelCopyWith<$Res> get province {
    return $ProvinceModelCopyWith<$Res>(_value.province, (value) {
      return _then(_value.copyWith(province: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CityModelCopyWith<$Res> get city {
    return $CityModelCopyWith<$Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressModelImplCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$AddressModelImplCopyWith(
          _$AddressModelImpl value, $Res Function(_$AddressModelImpl) then) =
      __$$AddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String alamat,
      num lat,
      num long,
      ProvinceModel province,
      CityModel city,
      bool? pinpointed,
      String description});

  @override
  $ProvinceModelCopyWith<$Res> get province;
  @override
  $CityModelCopyWith<$Res> get city;
}

/// @nodoc
class __$$AddressModelImplCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res, _$AddressModelImpl>
    implements _$$AddressModelImplCopyWith<$Res> {
  __$$AddressModelImplCopyWithImpl(
      _$AddressModelImpl _value, $Res Function(_$AddressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alamat = null,
    Object? lat = null,
    Object? long = null,
    Object? province = null,
    Object? city = null,
    Object? pinpointed = freezed,
    Object? description = null,
  }) {
    return _then(_$AddressModelImpl(
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as num,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as ProvinceModel,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityModel,
      pinpointed: freezed == pinpointed
          ? _value.pinpointed
          : pinpointed // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressModelImpl implements _AddressModel {
  const _$AddressModelImpl(
      {required this.alamat,
      required this.lat,
      required this.long,
      required this.province,
      required this.city,
      required this.pinpointed,
      required this.description});

  factory _$AddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressModelImplFromJson(json);

  @override
  final String alamat;
  @override
  final num lat;
  @override
  final num long;
  @override
  final ProvinceModel province;
  @override
  final CityModel city;
  @override
  final bool? pinpointed;
  @override
  final String description;

  @override
  String toString() {
    return 'AddressModel(alamat: $alamat, lat: $lat, long: $long, province: $province, city: $city, pinpointed: $pinpointed, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressModelImpl &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.pinpointed, pinpointed) ||
                other.pinpointed == pinpointed) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, alamat, lat, long, province, city, pinpointed, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      __$$AddressModelImplCopyWithImpl<_$AddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressModelImplToJson(
      this,
    );
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel(
      {required final String alamat,
      required final num lat,
      required final num long,
      required final ProvinceModel province,
      required final CityModel city,
      required final bool? pinpointed,
      required final String description}) = _$AddressModelImpl;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$AddressModelImpl.fromJson;

  @override
  String get alamat;
  @override
  num get lat;
  @override
  num get long;
  @override
  ProvinceModel get province;
  @override
  CityModel get city;
  @override
  bool? get pinpointed;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$AddressModelImplCopyWith<_$AddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
