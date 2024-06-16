import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_request.freezed.dart';
part 'transaction_request.g.dart';

@freezed
class TransactionRequest with _$TransactionRequest {
  factory TransactionRequest({
    @JsonKey(name: 'transactionId') int? transactionId,
    @JsonKey(name: 'customerPhone') String? customerPhone,
    @JsonKey(name: 'customerEmail') String? customerEmail,
    @JsonKey(name: 'customerName') String? customerName,
    @JsonKey(name: 'customerAddress') String? customerAddress,
  }) = _TransactionRequest;

  factory TransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionRequestFromJson(json);
}
