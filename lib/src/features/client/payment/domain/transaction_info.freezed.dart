// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionInfo _$TransactionInfoFromJson(Map<String, dynamic> json) {
  return _TransactionInfo.fromJson(json);
}

/// @nodoc
mixin _$TransactionInfo {
  String? get ptn => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceid')
  String? get serviceId => throw _privateConstructorUsedError;
  String? get merchant => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp')
  Timestamp? get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiptNumber')
  String? get receiptNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'veriCode')
  String? get verificationCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'clearingDate')
  DateTime? get clearingDate => throw _privateConstructorUsedError;
  String? get trid => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceLocalCur')
  double? get priceLocalCur => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceSystemCur')
  double? get priceSystemCur => throw _privateConstructorUsedError;
  @JsonKey(name: 'localCur')
  String? get localCur => throw _privateConstructorUsedError;
  @JsonKey(name: 'systemCur')
  String? get systemCur => throw _privateConstructorUsedError;
  String? get pin => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'payItemId')
  String? get payItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payItemDescr')
  String? get payItemDescr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionInfoCopyWith<TransactionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionInfoCopyWith<$Res> {
  factory $TransactionInfoCopyWith(
          TransactionInfo value, $Res Function(TransactionInfo) then) =
      _$TransactionInfoCopyWithImpl<$Res, TransactionInfo>;
  @useResult
  $Res call(
      {String? ptn,
      @JsonKey(name: 'serviceid') String? serviceId,
      String? merchant,
      @JsonKey(name: 'timestamp') Timestamp? timestamp,
      @JsonKey(name: 'receiptNumber') String? receiptNumber,
      @JsonKey(name: 'veriCode') String? verificationCode,
      @JsonKey(name: 'clearingDate') DateTime? clearingDate,
      String? trid,
      @JsonKey(name: 'priceLocalCur') double? priceLocalCur,
      @JsonKey(name: 'priceSystemCur') double? priceSystemCur,
      @JsonKey(name: 'localCur') String? localCur,
      @JsonKey(name: 'systemCur') String? systemCur,
      String? pin,
      String? status,
      @JsonKey(name: 'payItemId') String? payItemId,
      @JsonKey(name: 'payItemDescr') String? payItemDescr});

  $TimestampCopyWith<$Res>? get timestamp;
}

/// @nodoc
class _$TransactionInfoCopyWithImpl<$Res, $Val extends TransactionInfo>
    implements $TransactionInfoCopyWith<$Res> {
  _$TransactionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ptn = freezed,
    Object? serviceId = freezed,
    Object? merchant = freezed,
    Object? timestamp = freezed,
    Object? receiptNumber = freezed,
    Object? verificationCode = freezed,
    Object? clearingDate = freezed,
    Object? trid = freezed,
    Object? priceLocalCur = freezed,
    Object? priceSystemCur = freezed,
    Object? localCur = freezed,
    Object? systemCur = freezed,
    Object? pin = freezed,
    Object? status = freezed,
    Object? payItemId = freezed,
    Object? payItemDescr = freezed,
  }) {
    return _then(_value.copyWith(
      ptn: freezed == ptn
          ? _value.ptn
          : ptn // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      receiptNumber: freezed == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      clearingDate: freezed == clearingDate
          ? _value.clearingDate
          : clearingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      trid: freezed == trid
          ? _value.trid
          : trid // ignore: cast_nullable_to_non_nullable
              as String?,
      priceLocalCur: freezed == priceLocalCur
          ? _value.priceLocalCur
          : priceLocalCur // ignore: cast_nullable_to_non_nullable
              as double?,
      priceSystemCur: freezed == priceSystemCur
          ? _value.priceSystemCur
          : priceSystemCur // ignore: cast_nullable_to_non_nullable
              as double?,
      localCur: freezed == localCur
          ? _value.localCur
          : localCur // ignore: cast_nullable_to_non_nullable
              as String?,
      systemCur: freezed == systemCur
          ? _value.systemCur
          : systemCur // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      payItemId: freezed == payItemId
          ? _value.payItemId
          : payItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      payItemDescr: freezed == payItemDescr
          ? _value.payItemDescr
          : payItemDescr // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimestampCopyWith<$Res>? get timestamp {
    if (_value.timestamp == null) {
      return null;
    }

    return $TimestampCopyWith<$Res>(_value.timestamp!, (value) {
      return _then(_value.copyWith(timestamp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionInfoImplCopyWith<$Res>
    implements $TransactionInfoCopyWith<$Res> {
  factory _$$TransactionInfoImplCopyWith(_$TransactionInfoImpl value,
          $Res Function(_$TransactionInfoImpl) then) =
      __$$TransactionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? ptn,
      @JsonKey(name: 'serviceid') String? serviceId,
      String? merchant,
      @JsonKey(name: 'timestamp') Timestamp? timestamp,
      @JsonKey(name: 'receiptNumber') String? receiptNumber,
      @JsonKey(name: 'veriCode') String? verificationCode,
      @JsonKey(name: 'clearingDate') DateTime? clearingDate,
      String? trid,
      @JsonKey(name: 'priceLocalCur') double? priceLocalCur,
      @JsonKey(name: 'priceSystemCur') double? priceSystemCur,
      @JsonKey(name: 'localCur') String? localCur,
      @JsonKey(name: 'systemCur') String? systemCur,
      String? pin,
      String? status,
      @JsonKey(name: 'payItemId') String? payItemId,
      @JsonKey(name: 'payItemDescr') String? payItemDescr});

  @override
  $TimestampCopyWith<$Res>? get timestamp;
}

/// @nodoc
class __$$TransactionInfoImplCopyWithImpl<$Res>
    extends _$TransactionInfoCopyWithImpl<$Res, _$TransactionInfoImpl>
    implements _$$TransactionInfoImplCopyWith<$Res> {
  __$$TransactionInfoImplCopyWithImpl(
      _$TransactionInfoImpl _value, $Res Function(_$TransactionInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ptn = freezed,
    Object? serviceId = freezed,
    Object? merchant = freezed,
    Object? timestamp = freezed,
    Object? receiptNumber = freezed,
    Object? verificationCode = freezed,
    Object? clearingDate = freezed,
    Object? trid = freezed,
    Object? priceLocalCur = freezed,
    Object? priceSystemCur = freezed,
    Object? localCur = freezed,
    Object? systemCur = freezed,
    Object? pin = freezed,
    Object? status = freezed,
    Object? payItemId = freezed,
    Object? payItemDescr = freezed,
  }) {
    return _then(_$TransactionInfoImpl(
      ptn: freezed == ptn
          ? _value.ptn
          : ptn // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      receiptNumber: freezed == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      clearingDate: freezed == clearingDate
          ? _value.clearingDate
          : clearingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      trid: freezed == trid
          ? _value.trid
          : trid // ignore: cast_nullable_to_non_nullable
              as String?,
      priceLocalCur: freezed == priceLocalCur
          ? _value.priceLocalCur
          : priceLocalCur // ignore: cast_nullable_to_non_nullable
              as double?,
      priceSystemCur: freezed == priceSystemCur
          ? _value.priceSystemCur
          : priceSystemCur // ignore: cast_nullable_to_non_nullable
              as double?,
      localCur: freezed == localCur
          ? _value.localCur
          : localCur // ignore: cast_nullable_to_non_nullable
              as String?,
      systemCur: freezed == systemCur
          ? _value.systemCur
          : systemCur // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      payItemId: freezed == payItemId
          ? _value.payItemId
          : payItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      payItemDescr: freezed == payItemDescr
          ? _value.payItemDescr
          : payItemDescr // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TransactionInfoImpl implements _TransactionInfo {
  _$TransactionInfoImpl(
      {this.ptn,
      @JsonKey(name: 'serviceid') this.serviceId,
      this.merchant,
      @JsonKey(name: 'timestamp') this.timestamp,
      @JsonKey(name: 'receiptNumber') this.receiptNumber,
      @JsonKey(name: 'veriCode') this.verificationCode,
      @JsonKey(name: 'clearingDate') this.clearingDate,
      this.trid,
      @JsonKey(name: 'priceLocalCur') this.priceLocalCur,
      @JsonKey(name: 'priceSystemCur') this.priceSystemCur,
      @JsonKey(name: 'localCur') this.localCur,
      @JsonKey(name: 'systemCur') this.systemCur,
      this.pin,
      this.status,
      @JsonKey(name: 'payItemId') this.payItemId,
      @JsonKey(name: 'payItemDescr') this.payItemDescr});

  factory _$TransactionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionInfoImplFromJson(json);

  @override
  final String? ptn;
  @override
  @JsonKey(name: 'serviceid')
  final String? serviceId;
  @override
  final String? merchant;
  @override
  @JsonKey(name: 'timestamp')
  final Timestamp? timestamp;
  @override
  @JsonKey(name: 'receiptNumber')
  final String? receiptNumber;
  @override
  @JsonKey(name: 'veriCode')
  final String? verificationCode;
  @override
  @JsonKey(name: 'clearingDate')
  final DateTime? clearingDate;
  @override
  final String? trid;
  @override
  @JsonKey(name: 'priceLocalCur')
  final double? priceLocalCur;
  @override
  @JsonKey(name: 'priceSystemCur')
  final double? priceSystemCur;
  @override
  @JsonKey(name: 'localCur')
  final String? localCur;
  @override
  @JsonKey(name: 'systemCur')
  final String? systemCur;
  @override
  final String? pin;
  @override
  final String? status;
  @override
  @JsonKey(name: 'payItemId')
  final String? payItemId;
  @override
  @JsonKey(name: 'payItemDescr')
  final String? payItemDescr;

  @override
  String toString() {
    return 'TransactionInfo(ptn: $ptn, serviceId: $serviceId, merchant: $merchant, timestamp: $timestamp, receiptNumber: $receiptNumber, verificationCode: $verificationCode, clearingDate: $clearingDate, trid: $trid, priceLocalCur: $priceLocalCur, priceSystemCur: $priceSystemCur, localCur: $localCur, systemCur: $systemCur, pin: $pin, status: $status, payItemId: $payItemId, payItemDescr: $payItemDescr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionInfoImpl &&
            (identical(other.ptn, ptn) || other.ptn == ptn) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.receiptNumber, receiptNumber) ||
                other.receiptNumber == receiptNumber) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.clearingDate, clearingDate) ||
                other.clearingDate == clearingDate) &&
            (identical(other.trid, trid) || other.trid == trid) &&
            (identical(other.priceLocalCur, priceLocalCur) ||
                other.priceLocalCur == priceLocalCur) &&
            (identical(other.priceSystemCur, priceSystemCur) ||
                other.priceSystemCur == priceSystemCur) &&
            (identical(other.localCur, localCur) ||
                other.localCur == localCur) &&
            (identical(other.systemCur, systemCur) ||
                other.systemCur == systemCur) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.payItemId, payItemId) ||
                other.payItemId == payItemId) &&
            (identical(other.payItemDescr, payItemDescr) ||
                other.payItemDescr == payItemDescr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ptn,
      serviceId,
      merchant,
      timestamp,
      receiptNumber,
      verificationCode,
      clearingDate,
      trid,
      priceLocalCur,
      priceSystemCur,
      localCur,
      systemCur,
      pin,
      status,
      payItemId,
      payItemDescr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionInfoImplCopyWith<_$TransactionInfoImpl> get copyWith =>
      __$$TransactionInfoImplCopyWithImpl<_$TransactionInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionInfoImplToJson(
      this,
    );
  }
}

abstract class _TransactionInfo implements TransactionInfo {
  factory _TransactionInfo(
          {final String? ptn,
          @JsonKey(name: 'serviceid') final String? serviceId,
          final String? merchant,
          @JsonKey(name: 'timestamp') final Timestamp? timestamp,
          @JsonKey(name: 'receiptNumber') final String? receiptNumber,
          @JsonKey(name: 'veriCode') final String? verificationCode,
          @JsonKey(name: 'clearingDate') final DateTime? clearingDate,
          final String? trid,
          @JsonKey(name: 'priceLocalCur') final double? priceLocalCur,
          @JsonKey(name: 'priceSystemCur') final double? priceSystemCur,
          @JsonKey(name: 'localCur') final String? localCur,
          @JsonKey(name: 'systemCur') final String? systemCur,
          final String? pin,
          final String? status,
          @JsonKey(name: 'payItemId') final String? payItemId,
          @JsonKey(name: 'payItemDescr') final String? payItemDescr}) =
      _$TransactionInfoImpl;

  factory _TransactionInfo.fromJson(Map<String, dynamic> json) =
      _$TransactionInfoImpl.fromJson;

  @override
  String? get ptn;
  @override
  @JsonKey(name: 'serviceid')
  String? get serviceId;
  @override
  String? get merchant;
  @override
  @JsonKey(name: 'timestamp')
  Timestamp? get timestamp;
  @override
  @JsonKey(name: 'receiptNumber')
  String? get receiptNumber;
  @override
  @JsonKey(name: 'veriCode')
  String? get verificationCode;
  @override
  @JsonKey(name: 'clearingDate')
  DateTime? get clearingDate;
  @override
  String? get trid;
  @override
  @JsonKey(name: 'priceLocalCur')
  double? get priceLocalCur;
  @override
  @JsonKey(name: 'priceSystemCur')
  double? get priceSystemCur;
  @override
  @JsonKey(name: 'localCur')
  String? get localCur;
  @override
  @JsonKey(name: 'systemCur')
  String? get systemCur;
  @override
  String? get pin;
  @override
  String? get status;
  @override
  @JsonKey(name: 'payItemId')
  String? get payItemId;
  @override
  @JsonKey(name: 'payItemDescr')
  String? get payItemDescr;
  @override
  @JsonKey(ignore: true)
  _$$TransactionInfoImplCopyWith<_$TransactionInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Timestamp _$TimestampFromJson(Map<String, dynamic> json) {
  return _Timestamp.fromJson(json);
}

/// @nodoc
mixin _$Timestamp {
  int? get year => throw _privateConstructorUsedError;
  String? get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthValue')
  int? get monthValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'dayOfMonth')
  int? get dayOfMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'chronology')
  Chronology? get chronology => throw _privateConstructorUsedError;
  @JsonKey(name: 'dayOfWeek')
  String? get dayOfWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'leapYear')
  bool? get leapYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'dayOfYear')
  int? get dayOfYear => throw _privateConstructorUsedError;
  String? get era => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimestampCopyWith<Timestamp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimestampCopyWith<$Res> {
  factory $TimestampCopyWith(Timestamp value, $Res Function(Timestamp) then) =
      _$TimestampCopyWithImpl<$Res, Timestamp>;
  @useResult
  $Res call(
      {int? year,
      String? month,
      @JsonKey(name: 'monthValue') int? monthValue,
      @JsonKey(name: 'dayOfMonth') int? dayOfMonth,
      @JsonKey(name: 'chronology') Chronology? chronology,
      @JsonKey(name: 'dayOfWeek') String? dayOfWeek,
      @JsonKey(name: 'leapYear') bool? leapYear,
      @JsonKey(name: 'dayOfYear') int? dayOfYear,
      String? era});

  $ChronologyCopyWith<$Res>? get chronology;
}

/// @nodoc
class _$TimestampCopyWithImpl<$Res, $Val extends Timestamp>
    implements $TimestampCopyWith<$Res> {
  _$TimestampCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? monthValue = freezed,
    Object? dayOfMonth = freezed,
    Object? chronology = freezed,
    Object? dayOfWeek = freezed,
    Object? leapYear = freezed,
    Object? dayOfYear = freezed,
    Object? era = freezed,
  }) {
    return _then(_value.copyWith(
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      monthValue: freezed == monthValue
          ? _value.monthValue
          : monthValue // ignore: cast_nullable_to_non_nullable
              as int?,
      dayOfMonth: freezed == dayOfMonth
          ? _value.dayOfMonth
          : dayOfMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      chronology: freezed == chronology
          ? _value.chronology
          : chronology // ignore: cast_nullable_to_non_nullable
              as Chronology?,
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String?,
      leapYear: freezed == leapYear
          ? _value.leapYear
          : leapYear // ignore: cast_nullable_to_non_nullable
              as bool?,
      dayOfYear: freezed == dayOfYear
          ? _value.dayOfYear
          : dayOfYear // ignore: cast_nullable_to_non_nullable
              as int?,
      era: freezed == era
          ? _value.era
          : era // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChronologyCopyWith<$Res>? get chronology {
    if (_value.chronology == null) {
      return null;
    }

    return $ChronologyCopyWith<$Res>(_value.chronology!, (value) {
      return _then(_value.copyWith(chronology: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimestampImplCopyWith<$Res>
    implements $TimestampCopyWith<$Res> {
  factory _$$TimestampImplCopyWith(
          _$TimestampImpl value, $Res Function(_$TimestampImpl) then) =
      __$$TimestampImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? year,
      String? month,
      @JsonKey(name: 'monthValue') int? monthValue,
      @JsonKey(name: 'dayOfMonth') int? dayOfMonth,
      @JsonKey(name: 'chronology') Chronology? chronology,
      @JsonKey(name: 'dayOfWeek') String? dayOfWeek,
      @JsonKey(name: 'leapYear') bool? leapYear,
      @JsonKey(name: 'dayOfYear') int? dayOfYear,
      String? era});

  @override
  $ChronologyCopyWith<$Res>? get chronology;
}

/// @nodoc
class __$$TimestampImplCopyWithImpl<$Res>
    extends _$TimestampCopyWithImpl<$Res, _$TimestampImpl>
    implements _$$TimestampImplCopyWith<$Res> {
  __$$TimestampImplCopyWithImpl(
      _$TimestampImpl _value, $Res Function(_$TimestampImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? monthValue = freezed,
    Object? dayOfMonth = freezed,
    Object? chronology = freezed,
    Object? dayOfWeek = freezed,
    Object? leapYear = freezed,
    Object? dayOfYear = freezed,
    Object? era = freezed,
  }) {
    return _then(_$TimestampImpl(
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      monthValue: freezed == monthValue
          ? _value.monthValue
          : monthValue // ignore: cast_nullable_to_non_nullable
              as int?,
      dayOfMonth: freezed == dayOfMonth
          ? _value.dayOfMonth
          : dayOfMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      chronology: freezed == chronology
          ? _value.chronology
          : chronology // ignore: cast_nullable_to_non_nullable
              as Chronology?,
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String?,
      leapYear: freezed == leapYear
          ? _value.leapYear
          : leapYear // ignore: cast_nullable_to_non_nullable
              as bool?,
      dayOfYear: freezed == dayOfYear
          ? _value.dayOfYear
          : dayOfYear // ignore: cast_nullable_to_non_nullable
              as int?,
      era: freezed == era
          ? _value.era
          : era // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TimestampImpl implements _Timestamp {
  _$TimestampImpl(
      {this.year,
      this.month,
      @JsonKey(name: 'monthValue') this.monthValue,
      @JsonKey(name: 'dayOfMonth') this.dayOfMonth,
      @JsonKey(name: 'chronology') this.chronology,
      @JsonKey(name: 'dayOfWeek') this.dayOfWeek,
      @JsonKey(name: 'leapYear') this.leapYear,
      @JsonKey(name: 'dayOfYear') this.dayOfYear,
      this.era});

  factory _$TimestampImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimestampImplFromJson(json);

  @override
  final int? year;
  @override
  final String? month;
  @override
  @JsonKey(name: 'monthValue')
  final int? monthValue;
  @override
  @JsonKey(name: 'dayOfMonth')
  final int? dayOfMonth;
  @override
  @JsonKey(name: 'chronology')
  final Chronology? chronology;
  @override
  @JsonKey(name: 'dayOfWeek')
  final String? dayOfWeek;
  @override
  @JsonKey(name: 'leapYear')
  final bool? leapYear;
  @override
  @JsonKey(name: 'dayOfYear')
  final int? dayOfYear;
  @override
  final String? era;

  @override
  String toString() {
    return 'Timestamp(year: $year, month: $month, monthValue: $monthValue, dayOfMonth: $dayOfMonth, chronology: $chronology, dayOfWeek: $dayOfWeek, leapYear: $leapYear, dayOfYear: $dayOfYear, era: $era)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimestampImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.monthValue, monthValue) ||
                other.monthValue == monthValue) &&
            (identical(other.dayOfMonth, dayOfMonth) ||
                other.dayOfMonth == dayOfMonth) &&
            (identical(other.chronology, chronology) ||
                other.chronology == chronology) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.leapYear, leapYear) ||
                other.leapYear == leapYear) &&
            (identical(other.dayOfYear, dayOfYear) ||
                other.dayOfYear == dayOfYear) &&
            (identical(other.era, era) || other.era == era));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, year, month, monthValue,
      dayOfMonth, chronology, dayOfWeek, leapYear, dayOfYear, era);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimestampImplCopyWith<_$TimestampImpl> get copyWith =>
      __$$TimestampImplCopyWithImpl<_$TimestampImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimestampImplToJson(
      this,
    );
  }
}

abstract class _Timestamp implements Timestamp {
  factory _Timestamp(
      {final int? year,
      final String? month,
      @JsonKey(name: 'monthValue') final int? monthValue,
      @JsonKey(name: 'dayOfMonth') final int? dayOfMonth,
      @JsonKey(name: 'chronology') final Chronology? chronology,
      @JsonKey(name: 'dayOfWeek') final String? dayOfWeek,
      @JsonKey(name: 'leapYear') final bool? leapYear,
      @JsonKey(name: 'dayOfYear') final int? dayOfYear,
      final String? era}) = _$TimestampImpl;

  factory _Timestamp.fromJson(Map<String, dynamic> json) =
      _$TimestampImpl.fromJson;

  @override
  int? get year;
  @override
  String? get month;
  @override
  @JsonKey(name: 'monthValue')
  int? get monthValue;
  @override
  @JsonKey(name: 'dayOfMonth')
  int? get dayOfMonth;
  @override
  @JsonKey(name: 'chronology')
  Chronology? get chronology;
  @override
  @JsonKey(name: 'dayOfWeek')
  String? get dayOfWeek;
  @override
  @JsonKey(name: 'leapYear')
  bool? get leapYear;
  @override
  @JsonKey(name: 'dayOfYear')
  int? get dayOfYear;
  @override
  String? get era;
  @override
  @JsonKey(ignore: true)
  _$$TimestampImplCopyWith<_$TimestampImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Chronology _$ChronologyFromJson(Map<String, dynamic> json) {
  return _Chronology.fromJson(json);
}

/// @nodoc
mixin _$Chronology {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'calendarType')
  String? get calendarType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChronologyCopyWith<Chronology> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChronologyCopyWith<$Res> {
  factory $ChronologyCopyWith(
          Chronology value, $Res Function(Chronology) then) =
      _$ChronologyCopyWithImpl<$Res, Chronology>;
  @useResult
  $Res call({String? id, @JsonKey(name: 'calendarType') String? calendarType});
}

/// @nodoc
class _$ChronologyCopyWithImpl<$Res, $Val extends Chronology>
    implements $ChronologyCopyWith<$Res> {
  _$ChronologyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? calendarType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      calendarType: freezed == calendarType
          ? _value.calendarType
          : calendarType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChronologyImplCopyWith<$Res>
    implements $ChronologyCopyWith<$Res> {
  factory _$$ChronologyImplCopyWith(
          _$ChronologyImpl value, $Res Function(_$ChronologyImpl) then) =
      __$$ChronologyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, @JsonKey(name: 'calendarType') String? calendarType});
}

/// @nodoc
class __$$ChronologyImplCopyWithImpl<$Res>
    extends _$ChronologyCopyWithImpl<$Res, _$ChronologyImpl>
    implements _$$ChronologyImplCopyWith<$Res> {
  __$$ChronologyImplCopyWithImpl(
      _$ChronologyImpl _value, $Res Function(_$ChronologyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? calendarType = freezed,
  }) {
    return _then(_$ChronologyImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      calendarType: freezed == calendarType
          ? _value.calendarType
          : calendarType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ChronologyImpl implements _Chronology {
  _$ChronologyImpl({this.id, @JsonKey(name: 'calendarType') this.calendarType});

  factory _$ChronologyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChronologyImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'calendarType')
  final String? calendarType;

  @override
  String toString() {
    return 'Chronology(id: $id, calendarType: $calendarType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChronologyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.calendarType, calendarType) ||
                other.calendarType == calendarType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, calendarType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChronologyImplCopyWith<_$ChronologyImpl> get copyWith =>
      __$$ChronologyImplCopyWithImpl<_$ChronologyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChronologyImplToJson(
      this,
    );
  }
}

abstract class _Chronology implements Chronology {
  factory _Chronology(
          {final String? id,
          @JsonKey(name: 'calendarType') final String? calendarType}) =
      _$ChronologyImpl;

  factory _Chronology.fromJson(Map<String, dynamic> json) =
      _$ChronologyImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'calendarType')
  String? get calendarType;
  @override
  @JsonKey(ignore: true)
  _$$ChronologyImplCopyWith<_$ChronologyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
