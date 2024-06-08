import 'package:freezed_annotation/freezed_annotation.dart';

part 'initiate_request.freezed.dart';
part 'initiate_request.g.dart';

@freezed
class InitiateRequest with _$InitiateRequest {
  @JsonSerializable(explicitToJson: true)
  factory InitiateRequest({
    @JsonKey(name: 'command') int? command,
    @JsonKey(name: 'paymentMethod') int? paymentMethod,
    // @JsonKey(name: 'total') num? total,
    // @JsonKey(name: 'marchand') String? marchand,
    // @JsonKey(name: 'trid') String? trid,
  }) = _InitiateRequest;

  factory InitiateRequest.fromJson(Map<String, dynamic> json) => _$InitiateRequestFromJson(json);
}
