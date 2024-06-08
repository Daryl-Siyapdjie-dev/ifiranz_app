import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_response.freezed.dart';
part 'type_response.g.dart';

@freezed
class TypeResponse with _$TypeResponse {
  factory TypeResponse({
    required int id,
    required int version,
    String? code,
    required String designation,
  }) = _TypeResponse;

  factory TypeResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeResponseFromJson(json);
}
