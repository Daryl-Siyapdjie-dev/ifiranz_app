import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_response.freezed.dart';
part 'quote_response.g.dart';

@freezed
class QuoteResponse with _$QuoteResponse {
  @JsonSerializable(explicitToJson: true)
  factory QuoteResponse({
    Quote? quote,
  }) = _QuoteResponse;

  factory QuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$QuoteResponseFromJson(json);
}

@freezed
class Quote with _$Quote {
  @JsonSerializable(explicitToJson: true)
  factory Quote({
    @JsonKey(name: 'quoteId') String? quoteId,
    @JsonKey(name: 'expiresAt') ExpiresAt? expiresAt,
    @JsonKey(name: 'payItemId') String? payItemId,
    @JsonKey(name: 'amountLocalCur') int? amountLocalCur,
    @JsonKey(name: 'priceLocalCur') double? priceLocalCur,
    @JsonKey(name: 'priceSystemCur') double? priceSystemCur,
    @JsonKey(name: 'localCur') String? localCur,
    @JsonKey(name: 'systemCur') String? systemCur,
    promotion, // Change the type accordingly
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}

@freezed
class ExpiresAt with _$ExpiresAt {
  @JsonSerializable(explicitToJson: true)
  factory ExpiresAt({
    @JsonKey(name: 'year') int? year,
    @JsonKey(name: 'month') String? month,
    @JsonKey(name: 'monthValue') int? monthValue,
    @JsonKey(name: 'dayOfMonth') int? dayOfMonth,
    @JsonKey(name: 'chronology') Chronology? chronology,
    @JsonKey(name: 'dayOfWeek') String? dayOfWeek,
    @JsonKey(name: 'leapYear') bool? leapYear,
    @JsonKey(name: 'dayOfYear') int? dayOfYear,
    @JsonKey(name: 'era') String? era,
  }) = _ExpiresAt;

  factory ExpiresAt.fromJson(Map<String, dynamic> json) =>
      _$ExpiresAtFromJson(json);
}

@freezed
class Chronology with _$Chronology {
  @JsonSerializable(explicitToJson: true)
  factory Chronology({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'calendarType') String? calendarType,
  }) = _Chronology;

  factory Chronology.fromJson(Map<String, dynamic> json) =>
      _$ChronologyFromJson(json);
}
