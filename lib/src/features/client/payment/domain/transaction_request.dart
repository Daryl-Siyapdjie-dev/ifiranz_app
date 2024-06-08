import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_request.freezed.dart';
part 'transaction_request.g.dart';

@freezed
class TransactionRequest with _$TransactionRequest {
  factory TransactionRequest({
    @JsonKey(name: 'quoteId') String? quoteId,
    @JsonKey(name: 'customerPhonenumber') String? customerPhonenumber,
    @JsonKey(name: 'customerEmailaddress') String? customerEmailaddress,
    @JsonKey(name: 'customerName') String? customerName,
    @JsonKey(name: 'customerAddress') String? customerAddress,
    @JsonKey(name: 'serviceNumber') String? serviceNumber,
    @JsonKey(name: 'trid') String? trid,
  }) = _TransactionRequest;

  factory TransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionRequestFromJson(json);
}
