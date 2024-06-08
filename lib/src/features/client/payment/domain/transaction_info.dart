import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_info.freezed.dart';
part 'transaction_info.g.dart';

@freezed
class TransactionInfo with _$TransactionInfo {
  @JsonSerializable(explicitToJson: true)
  factory TransactionInfo({
    String? ptn,
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
    @JsonKey(name: 'payItemDescr') String? payItemDescr,
  }) = _TransactionInfo;

  factory TransactionInfo.fromJson(Map<String, dynamic> json) =>
      _$TransactionInfoFromJson(json);
}

@freezed
class Timestamp with _$Timestamp {
  @JsonSerializable(explicitToJson: true)
  factory Timestamp({
    int? year,
    String? month,
    @JsonKey(name: 'monthValue') int? monthValue,
    @JsonKey(name: 'dayOfMonth') int? dayOfMonth,
    @JsonKey(name: 'chronology') Chronology? chronology,
    @JsonKey(name: 'dayOfWeek') String? dayOfWeek,
    @JsonKey(name: 'leapYear') bool? leapYear,
    @JsonKey(name: 'dayOfYear') int? dayOfYear,
    String? era,
  }) = _Timestamp;

  factory Timestamp.fromJson(Map<String, dynamic> json) =>
      _$TimestampFromJson(json);
}

@freezed
class Chronology with _$Chronology {
  @JsonSerializable(explicitToJson: true)
  factory Chronology({
    String? id,
    @JsonKey(name: 'calendarType') String? calendarType,
  }) = _Chronology;

  factory Chronology.fromJson(Map<String, dynamic> json) =>
      _$ChronologyFromJson(json);
}
