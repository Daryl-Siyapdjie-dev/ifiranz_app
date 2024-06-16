// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) {
  return _TransactionResponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionResponse {
  int? get idDeal => throw _privateConstructorUsedError;
  int? get commandId => throw _privateConstructorUsedError;
  String? get commandCode => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  double? get commandAmount => throw _privateConstructorUsedError;
  double? get deliveryFees => throw _privateConstructorUsedError;
  dynamic get total => throw _privateConstructorUsedError;
  String? get trid => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get marchand => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get idOperator => throw _privateConstructorUsedError;
  String? get quoteId => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionResponseCopyWith<TransactionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionResponseCopyWith<$Res> {
  factory $TransactionResponseCopyWith(
          TransactionResponse value, $Res Function(TransactionResponse) then) =
      _$TransactionResponseCopyWithImpl<$Res, TransactionResponse>;
  @useResult
  $Res call(
      {int? idDeal,
      int? commandId,
      String? commandCode,
      String? code,
      String? paymentMethod,
      double? commandAmount,
      double? deliveryFees,
      dynamic total,
      String? trid,
      String? currency,
      String? marchand,
      String? transactionId,
      String? status,
      String? date,
      String? idOperator,
      String? quoteId,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$TransactionResponseCopyWithImpl<$Res, $Val extends TransactionResponse>
    implements $TransactionResponseCopyWith<$Res> {
  _$TransactionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDeal = freezed,
    Object? commandId = freezed,
    Object? commandCode = freezed,
    Object? code = freezed,
    Object? paymentMethod = freezed,
    Object? commandAmount = freezed,
    Object? deliveryFees = freezed,
    Object? total = freezed,
    Object? trid = freezed,
    Object? currency = freezed,
    Object? marchand = freezed,
    Object? transactionId = freezed,
    Object? status = freezed,
    Object? date = freezed,
    Object? idOperator = freezed,
    Object? quoteId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      idDeal: freezed == idDeal
          ? _value.idDeal
          : idDeal // ignore: cast_nullable_to_non_nullable
              as int?,
      commandId: freezed == commandId
          ? _value.commandId
          : commandId // ignore: cast_nullable_to_non_nullable
              as int?,
      commandCode: freezed == commandCode
          ? _value.commandCode
          : commandCode // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      commandAmount: freezed == commandAmount
          ? _value.commandAmount
          : commandAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryFees: freezed == deliveryFees
          ? _value.deliveryFees
          : deliveryFees // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as dynamic,
      trid: freezed == trid
          ? _value.trid
          : trid // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      marchand: freezed == marchand
          ? _value.marchand
          : marchand // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      idOperator: freezed == idOperator
          ? _value.idOperator
          : idOperator // ignore: cast_nullable_to_non_nullable
              as String?,
      quoteId: freezed == quoteId
          ? _value.quoteId
          : quoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionResponseImplCopyWith<$Res>
    implements $TransactionResponseCopyWith<$Res> {
  factory _$$TransactionResponseImplCopyWith(_$TransactionResponseImpl value,
          $Res Function(_$TransactionResponseImpl) then) =
      __$$TransactionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? idDeal,
      int? commandId,
      String? commandCode,
      String? code,
      String? paymentMethod,
      double? commandAmount,
      double? deliveryFees,
      dynamic total,
      String? trid,
      String? currency,
      String? marchand,
      String? transactionId,
      String? status,
      String? date,
      String? idOperator,
      String? quoteId,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$TransactionResponseImplCopyWithImpl<$Res>
    extends _$TransactionResponseCopyWithImpl<$Res, _$TransactionResponseImpl>
    implements _$$TransactionResponseImplCopyWith<$Res> {
  __$$TransactionResponseImplCopyWithImpl(_$TransactionResponseImpl _value,
      $Res Function(_$TransactionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDeal = freezed,
    Object? commandId = freezed,
    Object? commandCode = freezed,
    Object? code = freezed,
    Object? paymentMethod = freezed,
    Object? commandAmount = freezed,
    Object? deliveryFees = freezed,
    Object? total = freezed,
    Object? trid = freezed,
    Object? currency = freezed,
    Object? marchand = freezed,
    Object? transactionId = freezed,
    Object? status = freezed,
    Object? date = freezed,
    Object? idOperator = freezed,
    Object? quoteId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TransactionResponseImpl(
      idDeal: freezed == idDeal
          ? _value.idDeal
          : idDeal // ignore: cast_nullable_to_non_nullable
              as int?,
      commandId: freezed == commandId
          ? _value.commandId
          : commandId // ignore: cast_nullable_to_non_nullable
              as int?,
      commandCode: freezed == commandCode
          ? _value.commandCode
          : commandCode // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      commandAmount: freezed == commandAmount
          ? _value.commandAmount
          : commandAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryFees: freezed == deliveryFees
          ? _value.deliveryFees
          : deliveryFees // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as dynamic,
      trid: freezed == trid
          ? _value.trid
          : trid // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      marchand: freezed == marchand
          ? _value.marchand
          : marchand // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      idOperator: freezed == idOperator
          ? _value.idOperator
          : idOperator // ignore: cast_nullable_to_non_nullable
              as String?,
      quoteId: freezed == quoteId
          ? _value.quoteId
          : quoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionResponseImpl implements _TransactionResponse {
  _$TransactionResponseImpl(
      {this.idDeal,
      this.commandId,
      this.commandCode,
      this.code,
      this.paymentMethod,
      this.commandAmount,
      this.deliveryFees,
      this.total,
      this.trid,
      this.currency,
      this.marchand,
      this.transactionId,
      this.status,
      this.date,
      this.idOperator,
      this.quoteId,
      this.createdAt,
      this.updatedAt});

  factory _$TransactionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionResponseImplFromJson(json);

  @override
  final int? idDeal;
  @override
  final int? commandId;
  @override
  final String? commandCode;
  @override
  final String? code;
  @override
  final String? paymentMethod;
  @override
  final double? commandAmount;
  @override
  final double? deliveryFees;
  @override
  final dynamic total;
  @override
  final String? trid;
  @override
  final String? currency;
  @override
  final String? marchand;
  @override
  final String? transactionId;
  @override
  final String? status;
  @override
  final String? date;
  @override
  final String? idOperator;
  @override
  final String? quoteId;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'TransactionResponse(idDeal: $idDeal, commandId: $commandId, commandCode: $commandCode, code: $code, paymentMethod: $paymentMethod, commandAmount: $commandAmount, deliveryFees: $deliveryFees, total: $total, trid: $trid, currency: $currency, marchand: $marchand, transactionId: $transactionId, status: $status, date: $date, idOperator: $idOperator, quoteId: $quoteId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionResponseImpl &&
            (identical(other.idDeal, idDeal) || other.idDeal == idDeal) &&
            (identical(other.commandId, commandId) ||
                other.commandId == commandId) &&
            (identical(other.commandCode, commandCode) ||
                other.commandCode == commandCode) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.commandAmount, commandAmount) ||
                other.commandAmount == commandAmount) &&
            (identical(other.deliveryFees, deliveryFees) ||
                other.deliveryFees == deliveryFees) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            (identical(other.trid, trid) || other.trid == trid) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.marchand, marchand) ||
                other.marchand == marchand) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.idOperator, idOperator) ||
                other.idOperator == idOperator) &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idDeal,
      commandId,
      commandCode,
      code,
      paymentMethod,
      commandAmount,
      deliveryFees,
      const DeepCollectionEquality().hash(total),
      trid,
      currency,
      marchand,
      transactionId,
      status,
      date,
      idOperator,
      quoteId,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionResponseImplCopyWith<_$TransactionResponseImpl> get copyWith =>
      __$$TransactionResponseImplCopyWithImpl<_$TransactionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionResponseImplToJson(
      this,
    );
  }
}

abstract class _TransactionResponse implements TransactionResponse {
  factory _TransactionResponse(
      {final int? idDeal,
      final int? commandId,
      final String? commandCode,
      final String? code,
      final String? paymentMethod,
      final double? commandAmount,
      final double? deliveryFees,
      final dynamic total,
      final String? trid,
      final String? currency,
      final String? marchand,
      final String? transactionId,
      final String? status,
      final String? date,
      final String? idOperator,
      final String? quoteId,
      final String? createdAt,
      final String? updatedAt}) = _$TransactionResponseImpl;

  factory _TransactionResponse.fromJson(Map<String, dynamic> json) =
      _$TransactionResponseImpl.fromJson;

  @override
  int? get idDeal;
  @override
  int? get commandId;
  @override
  String? get commandCode;
  @override
  String? get code;
  @override
  String? get paymentMethod;
  @override
  double? get commandAmount;
  @override
  double? get deliveryFees;
  @override
  dynamic get total;
  @override
  String? get trid;
  @override
  String? get currency;
  @override
  String? get marchand;
  @override
  String? get transactionId;
  @override
  String? get status;
  @override
  String? get date;
  @override
  String? get idOperator;
  @override
  String? get quoteId;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TransactionResponseImplCopyWith<_$TransactionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
