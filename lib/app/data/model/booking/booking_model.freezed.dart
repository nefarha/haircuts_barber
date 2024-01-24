// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) {
  return _BookingModel.fromJson(json);
}

/// @nodoc
mixin _$BookingModel {
  String get id => throw _privateConstructorUsedError;
  String get bookerId => throw _privateConstructorUsedError;
  String get bookerName => throw _privateConstructorUsedError;
  String? get bookerPicture => throw _privateConstructorUsedError;
  String get barberId => throw _privateConstructorUsedError;
  String get barberName => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  ServiceModel get paketBarber => throw _privateConstructorUsedError;
  DateTime get tanggal => throw _privateConstructorUsedError;
  String get jam => throw _privateConstructorUsedError;
  num get tax => throw _privateConstructorUsedError;
  num get totalPrice => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get paymentType => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingModelCopyWith<BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingModelCopyWith<$Res> {
  factory $BookingModelCopyWith(
          BookingModel value, $Res Function(BookingModel) then) =
      _$BookingModelCopyWithImpl<$Res, BookingModel>;
  @useResult
  $Res call(
      {String id,
      String bookerId,
      String bookerName,
      String? bookerPicture,
      String barberId,
      String barberName,
      String ownerId,
      ServiceModel paketBarber,
      DateTime tanggal,
      String jam,
      num tax,
      num totalPrice,
      String status,
      String paymentType,
      DateTime createdAt});

  $ServiceModelCopyWith<$Res> get paketBarber;
}

/// @nodoc
class _$BookingModelCopyWithImpl<$Res, $Val extends BookingModel>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookerId = null,
    Object? bookerName = null,
    Object? bookerPicture = freezed,
    Object? barberId = null,
    Object? barberName = null,
    Object? ownerId = null,
    Object? paketBarber = null,
    Object? tanggal = null,
    Object? jam = null,
    Object? tax = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? paymentType = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookerId: null == bookerId
          ? _value.bookerId
          : bookerId // ignore: cast_nullable_to_non_nullable
              as String,
      bookerName: null == bookerName
          ? _value.bookerName
          : bookerName // ignore: cast_nullable_to_non_nullable
              as String,
      bookerPicture: freezed == bookerPicture
          ? _value.bookerPicture
          : bookerPicture // ignore: cast_nullable_to_non_nullable
              as String?,
      barberId: null == barberId
          ? _value.barberId
          : barberId // ignore: cast_nullable_to_non_nullable
              as String,
      barberName: null == barberName
          ? _value.barberName
          : barberName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      paketBarber: null == paketBarber
          ? _value.paketBarber
          : paketBarber // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as DateTime,
      jam: null == jam
          ? _value.jam
          : jam // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as num,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceModelCopyWith<$Res> get paketBarber {
    return $ServiceModelCopyWith<$Res>(_value.paketBarber, (value) {
      return _then(_value.copyWith(paketBarber: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingModelImplCopyWith<$Res>
    implements $BookingModelCopyWith<$Res> {
  factory _$$BookingModelImplCopyWith(
          _$BookingModelImpl value, $Res Function(_$BookingModelImpl) then) =
      __$$BookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String bookerId,
      String bookerName,
      String? bookerPicture,
      String barberId,
      String barberName,
      String ownerId,
      ServiceModel paketBarber,
      DateTime tanggal,
      String jam,
      num tax,
      num totalPrice,
      String status,
      String paymentType,
      DateTime createdAt});

  @override
  $ServiceModelCopyWith<$Res> get paketBarber;
}

/// @nodoc
class __$$BookingModelImplCopyWithImpl<$Res>
    extends _$BookingModelCopyWithImpl<$Res, _$BookingModelImpl>
    implements _$$BookingModelImplCopyWith<$Res> {
  __$$BookingModelImplCopyWithImpl(
      _$BookingModelImpl _value, $Res Function(_$BookingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookerId = null,
    Object? bookerName = null,
    Object? bookerPicture = freezed,
    Object? barberId = null,
    Object? barberName = null,
    Object? ownerId = null,
    Object? paketBarber = null,
    Object? tanggal = null,
    Object? jam = null,
    Object? tax = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? paymentType = null,
    Object? createdAt = null,
  }) {
    return _then(_$BookingModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookerId: null == bookerId
          ? _value.bookerId
          : bookerId // ignore: cast_nullable_to_non_nullable
              as String,
      bookerName: null == bookerName
          ? _value.bookerName
          : bookerName // ignore: cast_nullable_to_non_nullable
              as String,
      bookerPicture: freezed == bookerPicture
          ? _value.bookerPicture
          : bookerPicture // ignore: cast_nullable_to_non_nullable
              as String?,
      barberId: null == barberId
          ? _value.barberId
          : barberId // ignore: cast_nullable_to_non_nullable
              as String,
      barberName: null == barberName
          ? _value.barberName
          : barberName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      paketBarber: null == paketBarber
          ? _value.paketBarber
          : paketBarber // ignore: cast_nullable_to_non_nullable
              as ServiceModel,
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as DateTime,
      jam: null == jam
          ? _value.jam
          : jam // ignore: cast_nullable_to_non_nullable
              as String,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as num,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
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
class _$BookingModelImpl implements _BookingModel {
  const _$BookingModelImpl(
      {required this.id,
      required this.bookerId,
      required this.bookerName,
      required this.bookerPicture,
      required this.barberId,
      required this.barberName,
      required this.ownerId,
      required this.paketBarber,
      required this.tanggal,
      required this.jam,
      required this.tax,
      required this.totalPrice,
      required this.status,
      required this.paymentType,
      required this.createdAt});

  factory _$BookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingModelImplFromJson(json);

  @override
  final String id;
  @override
  final String bookerId;
  @override
  final String bookerName;
  @override
  final String? bookerPicture;
  @override
  final String barberId;
  @override
  final String barberName;
  @override
  final String ownerId;
  @override
  final ServiceModel paketBarber;
  @override
  final DateTime tanggal;
  @override
  final String jam;
  @override
  final num tax;
  @override
  final num totalPrice;
  @override
  final String status;
  @override
  final String paymentType;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'BookingModel(id: $id, bookerId: $bookerId, bookerName: $bookerName, bookerPicture: $bookerPicture, barberId: $barberId, barberName: $barberName, ownerId: $ownerId, paketBarber: $paketBarber, tanggal: $tanggal, jam: $jam, tax: $tax, totalPrice: $totalPrice, status: $status, paymentType: $paymentType, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookerId, bookerId) ||
                other.bookerId == bookerId) &&
            (identical(other.bookerName, bookerName) ||
                other.bookerName == bookerName) &&
            (identical(other.bookerPicture, bookerPicture) ||
                other.bookerPicture == bookerPicture) &&
            (identical(other.barberId, barberId) ||
                other.barberId == barberId) &&
            (identical(other.barberName, barberName) ||
                other.barberName == barberName) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.paketBarber, paketBarber) ||
                other.paketBarber == paketBarber) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.jam, jam) || other.jam == jam) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bookerId,
      bookerName,
      bookerPicture,
      barberId,
      barberName,
      ownerId,
      paketBarber,
      tanggal,
      jam,
      tax,
      totalPrice,
      status,
      paymentType,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      __$$BookingModelImplCopyWithImpl<_$BookingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingModelImplToJson(
      this,
    );
  }
}

abstract class _BookingModel implements BookingModel {
  const factory _BookingModel(
      {required final String id,
      required final String bookerId,
      required final String bookerName,
      required final String? bookerPicture,
      required final String barberId,
      required final String barberName,
      required final String ownerId,
      required final ServiceModel paketBarber,
      required final DateTime tanggal,
      required final String jam,
      required final num tax,
      required final num totalPrice,
      required final String status,
      required final String paymentType,
      required final DateTime createdAt}) = _$BookingModelImpl;

  factory _BookingModel.fromJson(Map<String, dynamic> json) =
      _$BookingModelImpl.fromJson;

  @override
  String get id;
  @override
  String get bookerId;
  @override
  String get bookerName;
  @override
  String? get bookerPicture;
  @override
  String get barberId;
  @override
  String get barberName;
  @override
  String get ownerId;
  @override
  ServiceModel get paketBarber;
  @override
  DateTime get tanggal;
  @override
  String get jam;
  @override
  num get tax;
  @override
  num get totalPrice;
  @override
  String get status;
  @override
  String get paymentType;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
