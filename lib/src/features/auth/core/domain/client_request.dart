import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_request.freezed.dart';
part 'client_request.g.dart';

@freezed
class ClientRequest with _$ClientRequest {
  factory ClientRequest(
      {@Default("user") String key,
      String? value,
      @Default("EQUAL") String type}) = _ClientRequest;

  factory ClientRequest.fromJson(Map<String, dynamic> json) =>
      _$ClientRequestFromJson(json);
}
