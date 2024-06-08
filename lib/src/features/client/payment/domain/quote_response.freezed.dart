// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuoteResponse _$QuoteResponseFromJson(Map<String, dynamic> json) {
  return _QuoteResponse.fromJson(json);
}

/// @nodoc
mixin _$QuoteResponse {
  Quote? get quote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteResponseCopyWith<QuoteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteResponseCopyWith<$Res> {
  factory $QuoteResponseCopyWith(
          QuoteResponse value, $Res Function(QuoteResponse) then) =
      _$QuoteResponseCopyWithImpl<$Res, QuoteResponse>;
  @useResult
  $Res call({Quote? quote});

  $QuoteCopyWith<$Res>? get quote;
}

/// @nodoc
class _$QuoteResponseCopyWithImpl<$Res, $Val extends QuoteResponse>
    implements $QuoteResponseCopyWith<$Res> {
  _$QuoteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quote = freezed,
  }) {
    return _then(_value.copyWith(
      quote: freezed == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as Quote?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuoteCopyWith<$Res>? get quote {
    if (_value.quote == null) {
      return null;
    }

    return $QuoteCopyWith<$Res>(_value.quote!, (value) {
      return _then(_value.copyWith(quote: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuoteResponseImplCopyWith<$Res>
    implements $QuoteResponseCopyWith<$Res> {
  factory _$$QuoteResponseImplCopyWith(
          _$QuoteResponseImpl value, $Res Function(_$QuoteResponseImpl) then) =
      __$$QuoteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Quote? quote});

  @override
  $QuoteCopyWith<$Res>? get quote;
}

/// @nodoc
class __$$QuoteResponseImplCopyWithImpl<$Res>
    extends _$QuoteResponseCopyWithImpl<$Res, _$QuoteResponseImpl>
    implements _$$QuoteResponseImplCopyWith<$Res> {
  __$$QuoteResponseImplCopyWithImpl(
      _$QuoteResponseImpl _value, $Res Function(_$QuoteResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quote = freezed,
  }) {
    return _then(_$QuoteResponseImpl(
      quote: freezed == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as Quote?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$QuoteResponseImpl implements _QuoteResponse {
  _$QuoteResponseImpl({this.quote});

  factory _$QuoteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuoteResponseImplFromJson(json);

  @override
  final Quote? quote;

  @override
  String toString() {
    return 'QuoteResponse(quote: $quote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteResponseImpl &&
            (identical(other.quote, quote) || other.quote == quote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteResponseImplCopyWith<_$QuoteResponseImpl> get copyWith =>
      __$$QuoteResponseImplCopyWithImpl<_$QuoteResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuoteResponseImplToJson(
      this,
    );
  }
}

abstract class _QuoteResponse implements QuoteResponse {
  factory _QuoteResponse({final Quote? quote}) = _$QuoteResponseImpl;

  factory _QuoteResponse.fromJson(Map<String, dynamic> json) =
      _$QuoteResponseImpl.fromJson;

  @override
  Quote? get quote;
  @override
  @JsonKey(ignore: true)
  _$$QuoteResponseImplCopyWith<_$QuoteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return _Quote.fromJson(json);
}

/// @nodoc
mixin _$Quote {
  @JsonKey(name: 'quoteId')
  String? get quoteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiresAt')
  ExpiresAt? get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'payItemId')
  String? get payItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'amountLocalCur')
  int? get amountLocalCur => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceLocalCur')
  double? get priceLocalCur => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceSystemCur')
  double? get priceSystemCur => throw _privateConstructorUsedError;
  @JsonKey(name: 'localCur')
  String? get localCur => throw _privateConstructorUsedError;
  @JsonKey(name: 'systemCur')
  String? get systemCur => throw _privateConstructorUsedError;
  dynamic get promotion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteCopyWith<Quote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteCopyWith<$Res> {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) then) =
      _$QuoteCopyWithImpl<$Res, Quote>;
  @useResult
  $Res call(
      {@JsonKey(name: 'quoteId') String? quoteId,
      @JsonKey(name: 'expiresAt') ExpiresAt? expiresAt,
      @JsonKey(name: 'payItemId') String? payItemId,
      @JsonKey(name: 'amountLocalCur') int? amountLocalCur,
      @JsonKey(name: 'priceLocalCur') double? priceLocalCur,
      @JsonKey(name: 'priceSystemCur') double? priceSystemCur,
      @JsonKey(name: 'localCur') String? localCur,
      @JsonKey(name: 'systemCur') String? systemCur,
      dynamic promotion});

  $ExpiresAtCopyWith<$Res>? get expiresAt;
}

/// @nodoc
class _$QuoteCopyWithImpl<$Res, $Val extends Quote>
    implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quoteId = freezed,
    Object? expiresAt = freezed,
    Object? payItemId = freezed,
    Object? amountLocalCur = freezed,
    Object? priceLocalCur = freezed,
    Object? priceSystemCur = freezed,
    Object? localCur = freezed,
    Object? systemCur = freezed,
    Object? promotion = freezed,
  }) {
    return _then(_value.copyWith(
      quoteId: freezed == quoteId
          ? _value.quoteId
          : quoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as ExpiresAt?,
      payItemId: freezed == payItemId
          ? _value.payItemId
          : payItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      amountLocalCur: freezed == amountLocalCur
          ? _value.amountLocalCur
          : amountLocalCur // ignore: cast_nullable_to_non_nullable
              as int?,
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
      promotion: freezed == promotion
          ? _value.promotion
          : promotion // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExpiresAtCopyWith<$Res>? get expiresAt {
    if (_value.expiresAt == null) {
      return null;
    }

    return $ExpiresAtCopyWith<$Res>(_value.expiresAt!, (value) {
      return _then(_value.copyWith(expiresAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuoteImplCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$$QuoteImplCopyWith(
          _$QuoteImpl value, $Res Function(_$QuoteImpl) then) =
      __$$QuoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'quoteId') String? quoteId,
      @JsonKey(name: 'expiresAt') ExpiresAt? expiresAt,
      @JsonKey(name: 'payItemId') String? payItemId,
      @JsonKey(name: 'amountLocalCur') int? amountLocalCur,
      @JsonKey(name: 'priceLocalCur') double? priceLocalCur,
      @JsonKey(name: 'priceSystemCur') double? priceSystemCur,
      @JsonKey(name: 'localCur') String? localCur,
      @JsonKey(name: 'systemCur') String? systemCur,
      dynamic promotion});

  @override
  $ExpiresAtCopyWith<$Res>? get expiresAt;
}

/// @nodoc
class __$$QuoteImplCopyWithImpl<$Res>
    extends _$QuoteCopyWithImpl<$Res, _$QuoteImpl>
    implements _$$QuoteImplCopyWith<$Res> {
  __$$QuoteImplCopyWithImpl(
      _$QuoteImpl _value, $Res Function(_$QuoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quoteId = freezed,
    Object? expiresAt = freezed,
    Object? payItemId = freezed,
    Object? amountLocalCur = freezed,
    Object? priceLocalCur = freezed,
    Object? priceSystemCur = freezed,
    Object? localCur = freezed,
    Object? systemCur = freezed,
    Object? promotion = freezed,
  }) {
    return _then(_$QuoteImpl(
      quoteId: freezed == quoteId
          ? _value.quoteId
          : quoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as ExpiresAt?,
      payItemId: freezed == payItemId
          ? _value.payItemId
          : payItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      amountLocalCur: freezed == amountLocalCur
          ? _value.amountLocalCur
          : amountLocalCur // ignore: cast_nullable_to_non_nullable
              as int?,
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
      promotion: freezed == promotion ? _value.promotion! : promotion,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$QuoteImpl implements _Quote {
  _$QuoteImpl(
      {@JsonKey(name: 'quoteId') this.quoteId,
      @JsonKey(name: 'expiresAt') this.expiresAt,
      @JsonKey(name: 'payItemId') this.payItemId,
      @JsonKey(name: 'amountLocalCur') this.amountLocalCur,
      @JsonKey(name: 'priceLocalCur') this.priceLocalCur,
      @JsonKey(name: 'priceSystemCur') this.priceSystemCur,
      @JsonKey(name: 'localCur') this.localCur,
      @JsonKey(name: 'systemCur') this.systemCur,
      this.promotion});

  factory _$QuoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuoteImplFromJson(json);

  @override
  @JsonKey(name: 'quoteId')
  final String? quoteId;
  @override
  @JsonKey(name: 'expiresAt')
  final ExpiresAt? expiresAt;
  @override
  @JsonKey(name: 'payItemId')
  final String? payItemId;
  @override
  @JsonKey(name: 'amountLocalCur')
  final int? amountLocalCur;
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
  final dynamic promotion;

  @override
  String toString() {
    return 'Quote(quoteId: $quoteId, expiresAt: $expiresAt, payItemId: $payItemId, amountLocalCur: $amountLocalCur, priceLocalCur: $priceLocalCur, priceSystemCur: $priceSystemCur, localCur: $localCur, systemCur: $systemCur, promotion: $promotion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteImpl &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.payItemId, payItemId) ||
                other.payItemId == payItemId) &&
            (identical(other.amountLocalCur, amountLocalCur) ||
                other.amountLocalCur == amountLocalCur) &&
            (identical(other.priceLocalCur, priceLocalCur) ||
                other.priceLocalCur == priceLocalCur) &&
            (identical(other.priceSystemCur, priceSystemCur) ||
                other.priceSystemCur == priceSystemCur) &&
            (identical(other.localCur, localCur) ||
                other.localCur == localCur) &&
            (identical(other.systemCur, systemCur) ||
                other.systemCur == systemCur) &&
            const DeepCollectionEquality().equals(other.promotion, promotion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quoteId,
      expiresAt,
      payItemId,
      amountLocalCur,
      priceLocalCur,
      priceSystemCur,
      localCur,
      systemCur,
      const DeepCollectionEquality().hash(promotion));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteImplCopyWith<_$QuoteImpl> get copyWith =>
      __$$QuoteImplCopyWithImpl<_$QuoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuoteImplToJson(
      this,
    );
  }
}

abstract class _Quote implements Quote {
  factory _Quote(
      {@JsonKey(name: 'quoteId') final String? quoteId,
      @JsonKey(name: 'expiresAt') final ExpiresAt? expiresAt,
      @JsonKey(name: 'payItemId') final String? payItemId,
      @JsonKey(name: 'amountLocalCur') final int? amountLocalCur,
      @JsonKey(name: 'priceLocalCur') final double? priceLocalCur,
      @JsonKey(name: 'priceSystemCur') final double? priceSystemCur,
      @JsonKey(name: 'localCur') final String? localCur,
      @JsonKey(name: 'systemCur') final String? systemCur,
      final dynamic promotion}) = _$QuoteImpl;

  factory _Quote.fromJson(Map<String, dynamic> json) = _$QuoteImpl.fromJson;

  @override
  @JsonKey(name: 'quoteId')
  String? get quoteId;
  @override
  @JsonKey(name: 'expiresAt')
  ExpiresAt? get expiresAt;
  @override
  @JsonKey(name: 'payItemId')
  String? get payItemId;
  @override
  @JsonKey(name: 'amountLocalCur')
  int? get amountLocalCur;
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
  dynamic get promotion;
  @override
  @JsonKey(ignore: true)
  _$$QuoteImplCopyWith<_$QuoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpiresAt _$ExpiresAtFromJson(Map<String, dynamic> json) {
  return _ExpiresAt.fromJson(json);
}

/// @nodoc
mixin _$ExpiresAt {
  @JsonKey(name: 'year')
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'month')
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
  @JsonKey(name: 'era')
  String? get era => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpiresAtCopyWith<ExpiresAt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpiresAtCopyWith<$Res> {
  factory $ExpiresAtCopyWith(ExpiresAt value, $Res Function(ExpiresAt) then) =
      _$ExpiresAtCopyWithImpl<$Res, ExpiresAt>;
  @useResult
  $Res call(
      {@JsonKey(name: 'year') int? year,
      @JsonKey(name: 'month') String? month,
      @JsonKey(name: 'monthValue') int? monthValue,
      @JsonKey(name: 'dayOfMonth') int? dayOfMonth,
      @JsonKey(name: 'chronology') Chronology? chronology,
      @JsonKey(name: 'dayOfWeek') String? dayOfWeek,
      @JsonKey(name: 'leapYear') bool? leapYear,
      @JsonKey(name: 'dayOfYear') int? dayOfYear,
      @JsonKey(name: 'era') String? era});

  $ChronologyCopyWith<$Res>? get chronology;
}

/// @nodoc
class _$ExpiresAtCopyWithImpl<$Res, $Val extends ExpiresAt>
    implements $ExpiresAtCopyWith<$Res> {
  _$ExpiresAtCopyWithImpl(this._value, this._then);

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
abstract class _$$ExpiresAtImplCopyWith<$Res>
    implements $ExpiresAtCopyWith<$Res> {
  factory _$$ExpiresAtImplCopyWith(
          _$ExpiresAtImpl value, $Res Function(_$ExpiresAtImpl) then) =
      __$$ExpiresAtImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'year') int? year,
      @JsonKey(name: 'month') String? month,
      @JsonKey(name: 'monthValue') int? monthValue,
      @JsonKey(name: 'dayOfMonth') int? dayOfMonth,
      @JsonKey(name: 'chronology') Chronology? chronology,
      @JsonKey(name: 'dayOfWeek') String? dayOfWeek,
      @JsonKey(name: 'leapYear') bool? leapYear,
      @JsonKey(name: 'dayOfYear') int? dayOfYear,
      @JsonKey(name: 'era') String? era});

  @override
  $ChronologyCopyWith<$Res>? get chronology;
}

/// @nodoc
class __$$ExpiresAtImplCopyWithImpl<$Res>
    extends _$ExpiresAtCopyWithImpl<$Res, _$ExpiresAtImpl>
    implements _$$ExpiresAtImplCopyWith<$Res> {
  __$$ExpiresAtImplCopyWithImpl(
      _$ExpiresAtImpl _value, $Res Function(_$ExpiresAtImpl) _then)
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
    return _then(_$ExpiresAtImpl(
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
class _$ExpiresAtImpl implements _ExpiresAt {
  _$ExpiresAtImpl(
      {@JsonKey(name: 'year') this.year,
      @JsonKey(name: 'month') this.month,
      @JsonKey(name: 'monthValue') this.monthValue,
      @JsonKey(name: 'dayOfMonth') this.dayOfMonth,
      @JsonKey(name: 'chronology') this.chronology,
      @JsonKey(name: 'dayOfWeek') this.dayOfWeek,
      @JsonKey(name: 'leapYear') this.leapYear,
      @JsonKey(name: 'dayOfYear') this.dayOfYear,
      @JsonKey(name: 'era') this.era});

  factory _$ExpiresAtImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiresAtImplFromJson(json);

  @override
  @JsonKey(name: 'year')
  final int? year;
  @override
  @JsonKey(name: 'month')
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
  @JsonKey(name: 'era')
  final String? era;

  @override
  String toString() {
    return 'ExpiresAt(year: $year, month: $month, monthValue: $monthValue, dayOfMonth: $dayOfMonth, chronology: $chronology, dayOfWeek: $dayOfWeek, leapYear: $leapYear, dayOfYear: $dayOfYear, era: $era)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpiresAtImpl &&
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
  _$$ExpiresAtImplCopyWith<_$ExpiresAtImpl> get copyWith =>
      __$$ExpiresAtImplCopyWithImpl<_$ExpiresAtImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiresAtImplToJson(
      this,
    );
  }
}

abstract class _ExpiresAt implements ExpiresAt {
  factory _ExpiresAt(
      {@JsonKey(name: 'year') final int? year,
      @JsonKey(name: 'month') final String? month,
      @JsonKey(name: 'monthValue') final int? monthValue,
      @JsonKey(name: 'dayOfMonth') final int? dayOfMonth,
      @JsonKey(name: 'chronology') final Chronology? chronology,
      @JsonKey(name: 'dayOfWeek') final String? dayOfWeek,
      @JsonKey(name: 'leapYear') final bool? leapYear,
      @JsonKey(name: 'dayOfYear') final int? dayOfYear,
      @JsonKey(name: 'era') final String? era}) = _$ExpiresAtImpl;

  factory _ExpiresAt.fromJson(Map<String, dynamic> json) =
      _$ExpiresAtImpl.fromJson;

  @override
  @JsonKey(name: 'year')
  int? get year;
  @override
  @JsonKey(name: 'month')
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
  @JsonKey(name: 'era')
  String? get era;
  @override
  @JsonKey(ignore: true)
  _$$ExpiresAtImplCopyWith<_$ExpiresAtImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Chronology _$ChronologyFromJson(Map<String, dynamic> json) {
  return _Chronology.fromJson(json);
}

/// @nodoc
mixin _$Chronology {
  @JsonKey(name: 'id')
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
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'calendarType') String? calendarType});
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
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'calendarType') String? calendarType});
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
  _$ChronologyImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'calendarType') this.calendarType});

  factory _$ChronologyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChronologyImplFromJson(json);

  @override
  @JsonKey(name: 'id')
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
          {@JsonKey(name: 'id') final String? id,
          @JsonKey(name: 'calendarType') final String? calendarType}) =
      _$ChronologyImpl;

  factory _Chronology.fromJson(Map<String, dynamic> json) =
      _$ChronologyImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'calendarType')
  String? get calendarType;
  @override
  @JsonKey(ignore: true)
  _$$ChronologyImplCopyWith<_$ChronologyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
