// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finalize_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FinalizeResponse _$FinalizeResponseFromJson(Map<String, dynamic> json) {
  return _FinalizeResponse.fromJson(json);
}

/// @nodoc
mixin _$FinalizeResponse {
  String? get ptn => throw _privateConstructorUsedError;
  Timestamp? get timestamp => throw _privateConstructorUsedError;
  double? get agentBalance => throw _privateConstructorUsedError;
  String? get receiptNumber => throw _privateConstructorUsedError;
  String? get veriCode => throw _privateConstructorUsedError;
  double? get priceLocalCur => throw _privateConstructorUsedError;
  double? get priceSystemCur => throw _privateConstructorUsedError;
  String? get localCur => throw _privateConstructorUsedError;
  String? get systemCur => throw _privateConstructorUsedError;
  String? get trid => throw _privateConstructorUsedError;
  String? get pin => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get payItemId => throw _privateConstructorUsedError;
  String? get payItemDescr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinalizeResponseCopyWith<FinalizeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinalizeResponseCopyWith<$Res> {
  factory $FinalizeResponseCopyWith(
          FinalizeResponse value, $Res Function(FinalizeResponse) then) =
      _$FinalizeResponseCopyWithImpl<$Res, FinalizeResponse>;
  @useResult
  $Res call(
      {String? ptn,
      Timestamp? timestamp,
      double? agentBalance,
      String? receiptNumber,
      String? veriCode,
      double? priceLocalCur,
      double? priceSystemCur,
      String? localCur,
      String? systemCur,
      String? trid,
      String? pin,
      String? status,
      String? payItemId,
      String? payItemDescr});

  $TimestampCopyWith<$Res>? get timestamp;
}

/// @nodoc
class _$FinalizeResponseCopyWithImpl<$Res, $Val extends FinalizeResponse>
    implements $FinalizeResponseCopyWith<$Res> {
  _$FinalizeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ptn = freezed,
    Object? timestamp = freezed,
    Object? agentBalance = freezed,
    Object? receiptNumber = freezed,
    Object? veriCode = freezed,
    Object? priceLocalCur = freezed,
    Object? priceSystemCur = freezed,
    Object? localCur = freezed,
    Object? systemCur = freezed,
    Object? trid = freezed,
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
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      agentBalance: freezed == agentBalance
          ? _value.agentBalance
          : agentBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      receiptNumber: freezed == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      veriCode: freezed == veriCode
          ? _value.veriCode
          : veriCode // ignore: cast_nullable_to_non_nullable
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
      trid: freezed == trid
          ? _value.trid
          : trid // ignore: cast_nullable_to_non_nullable
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
abstract class _$$FinalizeResponseImplCopyWith<$Res>
    implements $FinalizeResponseCopyWith<$Res> {
  factory _$$FinalizeResponseImplCopyWith(_$FinalizeResponseImpl value,
          $Res Function(_$FinalizeResponseImpl) then) =
      __$$FinalizeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? ptn,
      Timestamp? timestamp,
      double? agentBalance,
      String? receiptNumber,
      String? veriCode,
      double? priceLocalCur,
      double? priceSystemCur,
      String? localCur,
      String? systemCur,
      String? trid,
      String? pin,
      String? status,
      String? payItemId,
      String? payItemDescr});

  @override
  $TimestampCopyWith<$Res>? get timestamp;
}

/// @nodoc
class __$$FinalizeResponseImplCopyWithImpl<$Res>
    extends _$FinalizeResponseCopyWithImpl<$Res, _$FinalizeResponseImpl>
    implements _$$FinalizeResponseImplCopyWith<$Res> {
  __$$FinalizeResponseImplCopyWithImpl(_$FinalizeResponseImpl _value,
      $Res Function(_$FinalizeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ptn = freezed,
    Object? timestamp = freezed,
    Object? agentBalance = freezed,
    Object? receiptNumber = freezed,
    Object? veriCode = freezed,
    Object? priceLocalCur = freezed,
    Object? priceSystemCur = freezed,
    Object? localCur = freezed,
    Object? systemCur = freezed,
    Object? trid = freezed,
    Object? pin = freezed,
    Object? status = freezed,
    Object? payItemId = freezed,
    Object? payItemDescr = freezed,
  }) {
    return _then(_$FinalizeResponseImpl(
      ptn: freezed == ptn
          ? _value.ptn
          : ptn // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      agentBalance: freezed == agentBalance
          ? _value.agentBalance
          : agentBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      receiptNumber: freezed == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      veriCode: freezed == veriCode
          ? _value.veriCode
          : veriCode // ignore: cast_nullable_to_non_nullable
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
      trid: freezed == trid
          ? _value.trid
          : trid // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$FinalizeResponseImpl implements _FinalizeResponse {
  _$FinalizeResponseImpl(
      {this.ptn,
      this.timestamp,
      this.agentBalance,
      this.receiptNumber,
      this.veriCode,
      this.priceLocalCur,
      this.priceSystemCur,
      this.localCur,
      this.systemCur,
      this.trid,
      this.pin,
      this.status,
      this.payItemId,
      this.payItemDescr});

  factory _$FinalizeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinalizeResponseImplFromJson(json);

  @override
  final String? ptn;
  @override
  final Timestamp? timestamp;
  @override
  final double? agentBalance;
  @override
  final String? receiptNumber;
  @override
  final String? veriCode;
  @override
  final double? priceLocalCur;
  @override
  final double? priceSystemCur;
  @override
  final String? localCur;
  @override
  final String? systemCur;
  @override
  final String? trid;
  @override
  final String? pin;
  @override
  final String? status;
  @override
  final String? payItemId;
  @override
  final String? payItemDescr;

  @override
  String toString() {
    return 'FinalizeResponse(ptn: $ptn, timestamp: $timestamp, agentBalance: $agentBalance, receiptNumber: $receiptNumber, veriCode: $veriCode, priceLocalCur: $priceLocalCur, priceSystemCur: $priceSystemCur, localCur: $localCur, systemCur: $systemCur, trid: $trid, pin: $pin, status: $status, payItemId: $payItemId, payItemDescr: $payItemDescr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinalizeResponseImpl &&
            (identical(other.ptn, ptn) || other.ptn == ptn) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.agentBalance, agentBalance) ||
                other.agentBalance == agentBalance) &&
            (identical(other.receiptNumber, receiptNumber) ||
                other.receiptNumber == receiptNumber) &&
            (identical(other.veriCode, veriCode) ||
                other.veriCode == veriCode) &&
            (identical(other.priceLocalCur, priceLocalCur) ||
                other.priceLocalCur == priceLocalCur) &&
            (identical(other.priceSystemCur, priceSystemCur) ||
                other.priceSystemCur == priceSystemCur) &&
            (identical(other.localCur, localCur) ||
                other.localCur == localCur) &&
            (identical(other.systemCur, systemCur) ||
                other.systemCur == systemCur) &&
            (identical(other.trid, trid) || other.trid == trid) &&
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
      timestamp,
      agentBalance,
      receiptNumber,
      veriCode,
      priceLocalCur,
      priceSystemCur,
      localCur,
      systemCur,
      trid,
      pin,
      status,
      payItemId,
      payItemDescr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FinalizeResponseImplCopyWith<_$FinalizeResponseImpl> get copyWith =>
      __$$FinalizeResponseImplCopyWithImpl<_$FinalizeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinalizeResponseImplToJson(
      this,
    );
  }
}

abstract class _FinalizeResponse implements FinalizeResponse {
  factory _FinalizeResponse(
      {final String? ptn,
      final Timestamp? timestamp,
      final double? agentBalance,
      final String? receiptNumber,
      final String? veriCode,
      final double? priceLocalCur,
      final double? priceSystemCur,
      final String? localCur,
      final String? systemCur,
      final String? trid,
      final String? pin,
      final String? status,
      final String? payItemId,
      final String? payItemDescr}) = _$FinalizeResponseImpl;

  factory _FinalizeResponse.fromJson(Map<String, dynamic> json) =
      _$FinalizeResponseImpl.fromJson;

  @override
  String? get ptn;
  @override
  Timestamp? get timestamp;
  @override
  double? get agentBalance;
  @override
  String? get receiptNumber;
  @override
  String? get veriCode;
  @override
  double? get priceLocalCur;
  @override
  double? get priceSystemCur;
  @override
  String? get localCur;
  @override
  String? get systemCur;
  @override
  String? get trid;
  @override
  String? get pin;
  @override
  String? get status;
  @override
  String? get payItemId;
  @override
  String? get payItemDescr;
  @override
  @JsonKey(ignore: true)
  _$$FinalizeResponseImplCopyWith<_$FinalizeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Timestamp _$TimestampFromJson(Map<String, dynamic> json) {
  return _Timestamp.fromJson(json);
}

/// @nodoc
mixin _$Timestamp {
  int? get year => throw _privateConstructorUsedError;
  String? get month => throw _privateConstructorUsedError;
  int? get monthValue => throw _privateConstructorUsedError;
  int? get dayOfMonth => throw _privateConstructorUsedError;
  Chronology? get chronology => throw _privateConstructorUsedError;
  String? get dayOfWeek => throw _privateConstructorUsedError;
  bool? get leapYear => throw _privateConstructorUsedError;
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
      int? monthValue,
      int? dayOfMonth,
      Chronology? chronology,
      String? dayOfWeek,
      bool? leapYear,
      int? dayOfYear,
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
      int? monthValue,
      int? dayOfMonth,
      Chronology? chronology,
      String? dayOfWeek,
      bool? leapYear,
      int? dayOfYear,
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
@JsonSerializable()
class _$TimestampImpl implements _Timestamp {
  _$TimestampImpl(
      {this.year,
      this.month,
      this.monthValue,
      this.dayOfMonth,
      this.chronology,
      this.dayOfWeek,
      this.leapYear,
      this.dayOfYear,
      this.era});

  factory _$TimestampImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimestampImplFromJson(json);

  @override
  final int? year;
  @override
  final String? month;
  @override
  final int? monthValue;
  @override
  final int? dayOfMonth;
  @override
  final Chronology? chronology;
  @override
  final String? dayOfWeek;
  @override
  final bool? leapYear;
  @override
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
      final int? monthValue,
      final int? dayOfMonth,
      final Chronology? chronology,
      final String? dayOfWeek,
      final bool? leapYear,
      final int? dayOfYear,
      final String? era}) = _$TimestampImpl;

  factory _Timestamp.fromJson(Map<String, dynamic> json) =
      _$TimestampImpl.fromJson;

  @override
  int? get year;
  @override
  String? get month;
  @override
  int? get monthValue;
  @override
  int? get dayOfMonth;
  @override
  Chronology? get chronology;
  @override
  String? get dayOfWeek;
  @override
  bool? get leapYear;
  @override
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
  $Res call({String? id, String? calendarType});
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
  $Res call({String? id, String? calendarType});
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
@JsonSerializable()
class _$ChronologyImpl implements _Chronology {
  _$ChronologyImpl({this.id, this.calendarType});

  factory _$ChronologyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChronologyImplFromJson(json);

  @override
  final String? id;
  @override
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
  factory _Chronology({final String? id, final String? calendarType}) =
      _$ChronologyImpl;

  factory _Chronology.fromJson(Map<String, dynamic> json) =
      _$ChronologyImpl.fromJson;

  @override
  String? get id;
  @override
  String? get calendarType;
  @override
  @JsonKey(ignore: true)
  _$$ChronologyImplCopyWith<_$ChronologyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
