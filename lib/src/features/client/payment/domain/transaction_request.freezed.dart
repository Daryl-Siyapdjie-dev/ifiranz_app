// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionRequest _$TransactionRequestFromJson(Map<String, dynamic> json) {
  return _TransactionRequest.fromJson(json);
}

/// @nodoc
mixin _$TransactionRequest {
  @JsonKey(name: 'transactionId')
  int? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerPhone')
  String? get customerPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerEmail')
  String? get customerEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerName')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerAddress')
  String? get customerAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionRequestCopyWith<TransactionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionRequestCopyWith<$Res> {
  factory $TransactionRequestCopyWith(
          TransactionRequest value, $Res Function(TransactionRequest) then) =
      _$TransactionRequestCopyWithImpl<$Res, TransactionRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionId') int? transactionId,
      @JsonKey(name: 'customerPhone') String? customerPhone,
      @JsonKey(name: 'customerEmail') String? customerEmail,
      @JsonKey(name: 'customerName') String? customerName,
      @JsonKey(name: 'customerAddress') String? customerAddress});
}

/// @nodoc
class _$TransactionRequestCopyWithImpl<$Res, $Val extends TransactionRequest>
    implements $TransactionRequestCopyWith<$Res> {
  _$TransactionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? customerPhone = freezed,
    Object? customerEmail = freezed,
    Object? customerName = freezed,
    Object? customerAddress = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerPhone: freezed == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      customerEmail: freezed == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerAddress: freezed == customerAddress
          ? _value.customerAddress
          : customerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionRequestImplCopyWith<$Res>
    implements $TransactionRequestCopyWith<$Res> {
  factory _$$TransactionRequestImplCopyWith(_$TransactionRequestImpl value,
          $Res Function(_$TransactionRequestImpl) then) =
      __$$TransactionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionId') int? transactionId,
      @JsonKey(name: 'customerPhone') String? customerPhone,
      @JsonKey(name: 'customerEmail') String? customerEmail,
      @JsonKey(name: 'customerName') String? customerName,
      @JsonKey(name: 'customerAddress') String? customerAddress});
}

/// @nodoc
class __$$TransactionRequestImplCopyWithImpl<$Res>
    extends _$TransactionRequestCopyWithImpl<$Res, _$TransactionRequestImpl>
    implements _$$TransactionRequestImplCopyWith<$Res> {
  __$$TransactionRequestImplCopyWithImpl(_$TransactionRequestImpl _value,
      $Res Function(_$TransactionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? customerPhone = freezed,
    Object? customerEmail = freezed,
    Object? customerName = freezed,
    Object? customerAddress = freezed,
  }) {
    return _then(_$TransactionRequestImpl(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerPhone: freezed == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      customerEmail: freezed == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerAddress: freezed == customerAddress
          ? _value.customerAddress
          : customerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionRequestImpl implements _TransactionRequest {
  _$TransactionRequestImpl(
      {@JsonKey(name: 'transactionId') this.transactionId,
      @JsonKey(name: 'customerPhone') this.customerPhone,
      @JsonKey(name: 'customerEmail') this.customerEmail,
      @JsonKey(name: 'customerName') this.customerName,
      @JsonKey(name: 'customerAddress') this.customerAddress});

  factory _$TransactionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionRequestImplFromJson(json);

  @override
  @JsonKey(name: 'transactionId')
  final int? transactionId;
  @override
  @JsonKey(name: 'customerPhone')
  final String? customerPhone;
  @override
  @JsonKey(name: 'customerEmail')
  final String? customerEmail;
  @override
  @JsonKey(name: 'customerName')
  final String? customerName;
  @override
  @JsonKey(name: 'customerAddress')
  final String? customerAddress;

  @override
  String toString() {
    return 'TransactionRequest(transactionId: $transactionId, customerPhone: $customerPhone, customerEmail: $customerEmail, customerName: $customerName, customerAddress: $customerAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionRequestImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerAddress, customerAddress) ||
                other.customerAddress == customerAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionId, customerPhone,
      customerEmail, customerName, customerAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionRequestImplCopyWith<_$TransactionRequestImpl> get copyWith =>
      __$$TransactionRequestImplCopyWithImpl<_$TransactionRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionRequestImplToJson(
      this,
    );
  }
}

abstract class _TransactionRequest implements TransactionRequest {
  factory _TransactionRequest(
          {@JsonKey(name: 'transactionId') final int? transactionId,
          @JsonKey(name: 'customerPhone') final String? customerPhone,
          @JsonKey(name: 'customerEmail') final String? customerEmail,
          @JsonKey(name: 'customerName') final String? customerName,
          @JsonKey(name: 'customerAddress') final String? customerAddress}) =
      _$TransactionRequestImpl;

  factory _TransactionRequest.fromJson(Map<String, dynamic> json) =
      _$TransactionRequestImpl.fromJson;

  @override
  @JsonKey(name: 'transactionId')
  int? get transactionId;
  @override
  @JsonKey(name: 'customerPhone')
  String? get customerPhone;
  @override
  @JsonKey(name: 'customerEmail')
  String? get customerEmail;
  @override
  @JsonKey(name: 'customerName')
  String? get customerName;
  @override
  @JsonKey(name: 'customerAddress')
  String? get customerAddress;
  @override
  @JsonKey(ignore: true)
  _$$TransactionRequestImplCopyWith<_$TransactionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
