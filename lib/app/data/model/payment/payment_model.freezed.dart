// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return _PaymentModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentModel {
  String get userId => throw _privateConstructorUsedError;
  int get link_id => throw _privateConstructorUsedError;
  String get link_url => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get expired_date => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get is_address_required => throw _privateConstructorUsedError;
  int get is_phone_number_required => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  Map<dynamic, dynamic> get customer => throw _privateConstructorUsedError;
  String get paymentType => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  BookingModel? get bookingModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) then) =
      _$PaymentModelCopyWithImpl<$Res, PaymentModel>;
  @useResult
  $Res call(
      {String userId,
      int link_id,
      String link_url,
      String title,
      String type,
      int amount,
      String expired_date,
      String status,
      int is_address_required,
      int is_phone_number_required,
      int step,
      Map<dynamic, dynamic> customer,
      String paymentType,
      DateTime createdAt,
      BookingModel? bookingModel});

  $BookingModelCopyWith<$Res>? get bookingModel;
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res, $Val extends PaymentModel>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? link_id = null,
    Object? link_url = null,
    Object? title = null,
    Object? type = null,
    Object? amount = null,
    Object? expired_date = null,
    Object? status = null,
    Object? is_address_required = null,
    Object? is_phone_number_required = null,
    Object? step = null,
    Object? customer = null,
    Object? paymentType = null,
    Object? createdAt = null,
    Object? bookingModel = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      link_id: null == link_id
          ? _value.link_id
          : link_id // ignore: cast_nullable_to_non_nullable
              as int,
      link_url: null == link_url
          ? _value.link_url
          : link_url // ignore: cast_nullable_to_non_nullable
              as String,
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
              as int,
      expired_date: null == expired_date
          ? _value.expired_date
          : expired_date // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      is_address_required: null == is_address_required
          ? _value.is_address_required
          : is_address_required // ignore: cast_nullable_to_non_nullable
              as int,
      is_phone_number_required: null == is_phone_number_required
          ? _value.is_phone_number_required
          : is_phone_number_required // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bookingModel: freezed == bookingModel
          ? _value.bookingModel
          : bookingModel // ignore: cast_nullable_to_non_nullable
              as BookingModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookingModelCopyWith<$Res>? get bookingModel {
    if (_value.bookingModel == null) {
      return null;
    }

    return $BookingModelCopyWith<$Res>(_value.bookingModel!, (value) {
      return _then(_value.copyWith(bookingModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentModelImplCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$$PaymentModelImplCopyWith(
          _$PaymentModelImpl value, $Res Function(_$PaymentModelImpl) then) =
      __$$PaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      int link_id,
      String link_url,
      String title,
      String type,
      int amount,
      String expired_date,
      String status,
      int is_address_required,
      int is_phone_number_required,
      int step,
      Map<dynamic, dynamic> customer,
      String paymentType,
      DateTime createdAt,
      BookingModel? bookingModel});

  @override
  $BookingModelCopyWith<$Res>? get bookingModel;
}

/// @nodoc
class __$$PaymentModelImplCopyWithImpl<$Res>
    extends _$PaymentModelCopyWithImpl<$Res, _$PaymentModelImpl>
    implements _$$PaymentModelImplCopyWith<$Res> {
  __$$PaymentModelImplCopyWithImpl(
      _$PaymentModelImpl _value, $Res Function(_$PaymentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? link_id = null,
    Object? link_url = null,
    Object? title = null,
    Object? type = null,
    Object? amount = null,
    Object? expired_date = null,
    Object? status = null,
    Object? is_address_required = null,
    Object? is_phone_number_required = null,
    Object? step = null,
    Object? customer = null,
    Object? paymentType = null,
    Object? createdAt = null,
    Object? bookingModel = freezed,
  }) {
    return _then(_$PaymentModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      link_id: null == link_id
          ? _value.link_id
          : link_id // ignore: cast_nullable_to_non_nullable
              as int,
      link_url: null == link_url
          ? _value.link_url
          : link_url // ignore: cast_nullable_to_non_nullable
              as String,
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
              as int,
      expired_date: null == expired_date
          ? _value.expired_date
          : expired_date // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      is_address_required: null == is_address_required
          ? _value.is_address_required
          : is_address_required // ignore: cast_nullable_to_non_nullable
              as int,
      is_phone_number_required: null == is_phone_number_required
          ? _value.is_phone_number_required
          : is_phone_number_required // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      customer: null == customer
          ? _value._customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bookingModel: freezed == bookingModel
          ? _value.bookingModel
          : bookingModel // ignore: cast_nullable_to_non_nullable
              as BookingModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentModelImpl implements _PaymentModel {
  const _$PaymentModelImpl(
      {required this.userId,
      required this.link_id,
      required this.link_url,
      required this.title,
      required this.type,
      required this.amount,
      required this.expired_date,
      required this.status,
      required this.is_address_required,
      required this.is_phone_number_required,
      required this.step,
      required final Map<dynamic, dynamic> customer,
      required this.paymentType,
      required this.createdAt,
      required this.bookingModel})
      : _customer = customer;

  factory _$PaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentModelImplFromJson(json);

  @override
  final String userId;
  @override
  final int link_id;
  @override
  final String link_url;
  @override
  final String title;
  @override
  final String type;
  @override
  final int amount;
  @override
  final String expired_date;
  @override
  final String status;
  @override
  final int is_address_required;
  @override
  final int is_phone_number_required;
  @override
  final int step;
  final Map<dynamic, dynamic> _customer;
  @override
  Map<dynamic, dynamic> get customer {
    if (_customer is EqualUnmodifiableMapView) return _customer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customer);
  }

  @override
  final String paymentType;
  @override
  final DateTime createdAt;
  @override
  final BookingModel? bookingModel;

  @override
  String toString() {
    return 'PaymentModel(userId: $userId, link_id: $link_id, link_url: $link_url, title: $title, type: $type, amount: $amount, expired_date: $expired_date, status: $status, is_address_required: $is_address_required, is_phone_number_required: $is_phone_number_required, step: $step, customer: $customer, paymentType: $paymentType, createdAt: $createdAt, bookingModel: $bookingModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.link_id, link_id) || other.link_id == link_id) &&
            (identical(other.link_url, link_url) ||
                other.link_url == link_url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.expired_date, expired_date) ||
                other.expired_date == expired_date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.is_address_required, is_address_required) ||
                other.is_address_required == is_address_required) &&
            (identical(
                    other.is_phone_number_required, is_phone_number_required) ||
                other.is_phone_number_required == is_phone_number_required) &&
            (identical(other.step, step) || other.step == step) &&
            const DeepCollectionEquality().equals(other._customer, _customer) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.bookingModel, bookingModel) ||
                other.bookingModel == bookingModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      link_id,
      link_url,
      title,
      type,
      amount,
      expired_date,
      status,
      is_address_required,
      is_phone_number_required,
      step,
      const DeepCollectionEquality().hash(_customer),
      paymentType,
      createdAt,
      bookingModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      __$$PaymentModelImplCopyWithImpl<_$PaymentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentModel implements PaymentModel {
  const factory _PaymentModel(
      {required final String userId,
      required final int link_id,
      required final String link_url,
      required final String title,
      required final String type,
      required final int amount,
      required final String expired_date,
      required final String status,
      required final int is_address_required,
      required final int is_phone_number_required,
      required final int step,
      required final Map<dynamic, dynamic> customer,
      required final String paymentType,
      required final DateTime createdAt,
      required final BookingModel? bookingModel}) = _$PaymentModelImpl;

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$PaymentModelImpl.fromJson;

  @override
  String get userId;
  @override
  int get link_id;
  @override
  String get link_url;
  @override
  String get title;
  @override
  String get type;
  @override
  int get amount;
  @override
  String get expired_date;
  @override
  String get status;
  @override
  int get is_address_required;
  @override
  int get is_phone_number_required;
  @override
  int get step;
  @override
  Map<dynamic, dynamic> get customer;
  @override
  String get paymentType;
  @override
  DateTime get createdAt;
  @override
  BookingModel? get bookingModel;
  @override
  @JsonKey(ignore: true)
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
