import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_response.freezed.dart';
part 'transaction_response.g.dart';

@freezed
abstract class TransactionResponse with _$TransactionResponse {
  factory TransactionResponse({
    int? idDeal,
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
    String? updatedAt,
  }) = _TransactionResponse;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);
}
