import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_response.freezed.dart';
part 'transaction_response.g.dart';

@freezed
class TransactionResponse with _$TransactionResponse {
  factory TransactionResponse({
    @JsonKey(name: 'idDeal') int? idDeal,
    String? code,
    double? total,
    String? marchand,
    String? trid,
    String? status,
    String? date,
    String? time,
    @JsonKey(name: 'idOperator') String? idOperator,
    String? quoteId,
  }) = _TransactionResponse;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);
}
