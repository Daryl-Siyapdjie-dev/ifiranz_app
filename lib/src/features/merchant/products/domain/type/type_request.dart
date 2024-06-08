import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_request.freezed.dart';
part 'type_request.g.dart';

@freezed
class TypeRequest with _$TypeRequest {
  factory TypeRequest({
    required String designation,
    required String code,
  }) = _TypeRequest;

  factory TypeRequest.fromJson(Map<String, dynamic> json) =>
      _$TypeRequestFromJson(json);
}
