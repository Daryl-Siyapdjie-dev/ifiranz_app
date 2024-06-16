import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_transaction_request.freezed.dart';
part 'verify_transaction_request.g.dart';

@freezed
class VerifyTransactionRequest with _$VerifyTransactionRequest {
  const factory VerifyTransactionRequest({
    required int transactionId,
  }) = _VerifyTransactionRequest;

  factory VerifyTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyTransactionRequestFromJson(json);
}
