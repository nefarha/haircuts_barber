// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barberModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BarberModel _$BarberModelFromJson(Map<String, dynamic> json) {
  return _BarberModel.fromJson(json);
}

/// @nodoc
mixin _$BarberModel {
  String get id => throw _privateConstructorUsedError;
  String get namaToko => throw _privateConstructorUsedError;
  AddressModel get alamat => throw _privateConstructorUsedError;
  num get rating => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get deskripsiToko => throw _privateConstructorUsedError;
  List<ServiceModel> get daftarPaket => throw _privateConstructorUsedError;
  List<dynamic> get daftarGambar => throw _privateConstructorUsedError;
  String? get shopType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BarberModelCopyWith<BarberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarberModelCopyWith<$Res> {
  factory $BarberModelCopyWith(
          BarberModel value, $Res Function(BarberModel) then) =
      _$BarberModelCopyWithImpl<$Res, BarberModel>;
  @useResult
  $Res call(
      {String id,
      String namaToko,
      AddressModel alamat,
      num rating,
      String ownerId,
      String deskripsiToko,
      List<ServiceModel> daftarPaket,
      List<dynamic> daftarGambar,
      String? shopType});

  $AddressModelCopyWith<$Res> get alamat;
}

/// @nodoc
class _$BarberModelCopyWithImpl<$Res, $Val extends BarberModel>
    implements $BarberModelCopyWith<$Res> {
  _$BarberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namaToko = null,
    Object? alamat = null,
    Object? rating = null,
    Object? ownerId = null,
    Object? deskripsiToko = null,
    Object? daftarPaket = null,
    Object? daftarGambar = null,
    Object? shopType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namaToko: null == namaToko
          ? _value.namaToko
          : namaToko // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsiToko: null == deskripsiToko
          ? _value.deskripsiToko
          : deskripsiToko // ignore: cast_nullable_to_non_nullable
              as String,
      daftarPaket: null == daftarPaket
          ? _value.daftarPaket
          : daftarPaket // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
      daftarGambar: null == daftarGambar
          ? _value.daftarGambar
          : daftarGambar // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      shopType: freezed == shopType
          ? _value.shopType
          : shopType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res> get alamat {
    return $AddressModelCopyWith<$Res>(_value.alamat, (value) {
      return _then(_value.copyWith(alamat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BarberModelImplCopyWith<$Res>
    implements $BarberModelCopyWith<$Res> {
  factory _$$BarberModelImplCopyWith(
          _$BarberModelImpl value, $Res Function(_$BarberModelImpl) then) =
      __$$BarberModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String namaToko,
      AddressModel alamat,
      num rating,
      String ownerId,
      String deskripsiToko,
      List<ServiceModel> daftarPaket,
      List<dynamic> daftarGambar,
      String? shopType});

  @override
  $AddressModelCopyWith<$Res> get alamat;
}

/// @nodoc
class __$$BarberModelImplCopyWithImpl<$Res>
    extends _$BarberModelCopyWithImpl<$Res, _$BarberModelImpl>
    implements _$$BarberModelImplCopyWith<$Res> {
  __$$BarberModelImplCopyWithImpl(
      _$BarberModelImpl _value, $Res Function(_$BarberModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namaToko = null,
    Object? alamat = null,
    Object? rating = null,
    Object? ownerId = null,
    Object? deskripsiToko = null,
    Object? daftarPaket = null,
    Object? daftarGambar = null,
    Object? shopType = freezed,
  }) {
    return _then(_$BarberModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namaToko: null == namaToko
          ? _value.namaToko
          : namaToko // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsiToko: null == deskripsiToko
          ? _value.deskripsiToko
          : deskripsiToko // ignore: cast_nullable_to_non_nullable
              as String,
      daftarPaket: null == daftarPaket
          ? _value._daftarPaket
          : daftarPaket // ignore: cast_nullable_to_non_nullable
              as List<ServiceModel>,
      daftarGambar: null == daftarGambar
          ? _value._daftarGambar
          : daftarGambar // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      shopType: freezed == shopType
          ? _value.shopType
          : shopType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BarberModelImpl implements _BarberModel {
  const _$BarberModelImpl(
      {required this.id,
      required this.namaToko,
      required this.alamat,
      required this.rating,
      required this.ownerId,
      required this.deskripsiToko,
      required final List<ServiceModel> daftarPaket,
      required final List<dynamic> daftarGambar,
      required this.shopType})
      : _daftarPaket = daftarPaket,
        _daftarGambar = daftarGambar;

  factory _$BarberModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BarberModelImplFromJson(json);

  @override
  final String id;
  @override
  final String namaToko;
  @override
  final AddressModel alamat;
  @override
  final num rating;
  @override
  final String ownerId;
  @override
  final String deskripsiToko;
  final List<ServiceModel> _daftarPaket;
  @override
  List<ServiceModel> get daftarPaket {
    if (_daftarPaket is EqualUnmodifiableListView) return _daftarPaket;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daftarPaket);
  }

  final List<dynamic> _daftarGambar;
  @override
  List<dynamic> get daftarGambar {
    if (_daftarGambar is EqualUnmodifiableListView) return _daftarGambar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daftarGambar);
  }

  @override
  final String? shopType;

  @override
  String toString() {
    return 'BarberModel(id: $id, namaToko: $namaToko, alamat: $alamat, rating: $rating, ownerId: $ownerId, deskripsiToko: $deskripsiToko, daftarPaket: $daftarPaket, daftarGambar: $daftarGambar, shopType: $shopType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarberModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namaToko, namaToko) ||
                other.namaToko == namaToko) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.deskripsiToko, deskripsiToko) ||
                other.deskripsiToko == deskripsiToko) &&
            const DeepCollectionEquality()
                .equals(other._daftarPaket, _daftarPaket) &&
            const DeepCollectionEquality()
                .equals(other._daftarGambar, _daftarGambar) &&
            (identical(other.shopType, shopType) ||
                other.shopType == shopType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      namaToko,
      alamat,
      rating,
      ownerId,
      deskripsiToko,
      const DeepCollectionEquality().hash(_daftarPaket),
      const DeepCollectionEquality().hash(_daftarGambar),
      shopType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarberModelImplCopyWith<_$BarberModelImpl> get copyWith =>
      __$$BarberModelImplCopyWithImpl<_$BarberModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BarberModelImplToJson(
      this,
    );
  }
}

abstract class _BarberModel implements BarberModel {
  const factory _BarberModel(
      {required final String id,
      required final String namaToko,
      required final AddressModel alamat,
      required final num rating,
      required final String ownerId,
      required final String deskripsiToko,
      required final List<ServiceModel> daftarPaket,
      required final List<dynamic> daftarGambar,
      required final String? shopType}) = _$BarberModelImpl;

  factory _BarberModel.fromJson(Map<String, dynamic> json) =
      _$BarberModelImpl.fromJson;

  @override
  String get id;
  @override
  String get namaToko;
  @override
  AddressModel get alamat;
  @override
  num get rating;
  @override
  String get ownerId;
  @override
  String get deskripsiToko;
  @override
  List<ServiceModel> get daftarPaket;
  @override
  List<dynamic> get daftarGambar;
  @override
  String? get shopType;
  @override
  @JsonKey(ignore: true)
  _$$BarberModelImplCopyWith<_$BarberModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
