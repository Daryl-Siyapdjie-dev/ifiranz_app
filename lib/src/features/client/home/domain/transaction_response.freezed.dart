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
  String? get code => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  String? get marchand => throw _privateConstructorUsedError;
  String? get trid => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get idOperator => throw _privateConstructorUsedError;
  String? get quoteId => throw _privateConstructorUsedError;

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
      String? code,
      double? total,
      String? marchand,
      String? trid,
      String? status,
      String? date,
      String? idOperator,
      String? quoteId});
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
    Object? code = freezed,
    Object? total = freezed,
    Object? marchand = freezed,
    Object? trid = freezed,
    Object? status = freezed,
    Object? date = freezed,
    Object? idOperator = freezed,
    Object? quoteId = freezed,
  }) {
    return _then(_value.copyWith(
      idDeal: freezed == idDeal
          ? _value.idDeal
          : idDeal // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      marchand: freezed == marchand
          ? _value.marchand
          : marchand // ignore: cast_nullable_to_non_nullable
              as String?,
      trid: freezed == trid
          ? _value.trid
          : trid // ignore: cast_nullable_to_non_nullable
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
      String? code,
      double? total,
      String? marchand,
      String? trid,
      String? status,
      String? date,
      String? idOperator,
      String? quoteId});
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
    Object? code = freezed,
    Object? total = freezed,
    Object? marchand = freezed,
    Object? trid = freezed,
    Object? status = freezed,
    Object? date = freezed,
    Object? idOperator = freezed,
    Object? quoteId = freezed,
  }) {
    return _then(_$TransactionResponseImpl(
      idDeal: freezed == idDeal
          ? _value.idDeal
          : idDeal // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      marchand: freezed == marchand
          ? _value.marchand
          : marchand // ignore: cast_nullable_to_non_nullable
              as String?,
      trid: freezed == trid
          ? _value.trid
          : trid // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionResponseImpl implements _TransactionResponse {
  _$TransactionResponseImpl(
      {this.idDeal,
      this.code,
      this.total,
      this.marchand,
      this.trid,
      this.status,
      this.date,
      this.idOperator,
      this.quoteId});

  factory _$TransactionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionResponseImplFromJson(json);

  @override
  final int? idDeal;
  @override
  final String? code;
  @override
  final double? total;
  @override
  final String? marchand;
  @override
  final String? trid;
  @override
  final String? status;
  @override
  final String? date;
  @override
  final String? idOperator;
  @override
  final String? quoteId;

  @override
  String toString() {
    return 'TransactionResponse(idDeal: $idDeal, code: $code, total: $total, marchand: $marchand, trid: $trid, status: $status, date: $date, idOperator: $idOperator, quoteId: $quoteId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionResponseImpl &&
            (identical(other.idDeal, idDeal) || other.idDeal == idDeal) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.marchand, marchand) ||
                other.marchand == marchand) &&
            (identical(other.trid, trid) || other.trid == trid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.idOperator, idOperator) ||
                other.idOperator == idOperator) &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idDeal, code, total, marchand,
      trid, status, date, idOperator, quoteId);

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
      final String? code,
      final double? total,
      final String? marchand,
      final String? trid,
      final String? status,
      final String? date,
      final String? idOperator,
      final String? quoteId}) = _$TransactionResponseImpl;

  factory _TransactionResponse.fromJson(Map<String, dynamic> json) =
      _$TransactionResponseImpl.fromJson;

  @override
  int? get idDeal;
  @override
  String? get code;
  @override
  double? get total;
  @override
  String? get marchand;
  @override
  String? get trid;
  @override
  String? get status;
  @override
  String? get date;
  @override
  String? get idOperator;
  @override
  String? get quoteId;
  @override
  @JsonKey(ignore: true)
  _$$TransactionResponseImplCopyWith<_$TransactionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
