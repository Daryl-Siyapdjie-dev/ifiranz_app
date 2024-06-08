import 'package:freezed_annotation/freezed_annotation.dart';

part 'finalize_response.freezed.dart';
part 'finalize_response.g.dart';

@freezed
class FinalizeResponse with _$FinalizeResponse {
  factory FinalizeResponse({
    String? ptn,
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
    String? payItemDescr,
  }) = _FinalizeResponse;

  factory FinalizeResponse.fromJson(Map<String, dynamic> json) =>
      _$FinalizeResponseFromJson(json);
}

@freezed
class Timestamp with _$Timestamp {
  factory Timestamp({
    int? year,
    String? month,
    int? monthValue,
    int? dayOfMonth,
    Chronology? chronology,
    String? dayOfWeek,
    bool? leapYear,
    int? dayOfYear,
    String? era,
  }) = _Timestamp;

  factory Timestamp.fromJson(Map<String, dynamic> json) =>
      _$TimestampFromJson(json);
}

@freezed
class Chronology with _$Chronology {
  factory Chronology({
    String? id,
    String? calendarType,
  }) = _Chronology;

  factory Chronology.fromJson(Map<String, dynamic> json) =>
      _$ChronologyFromJson(json);
}
