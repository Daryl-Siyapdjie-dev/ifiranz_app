import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

part 'api_exception.g.dart';

@freezed
class ApiException with _$ApiException {
  @JsonSerializable(explicitToJson: true)
  const ApiException._();
  const factory ApiException({
    @JsonKey(name: 'statusCode') final int? code,
    @JsonKey(name: 'message') final String? msg,
    @JsonKey(name: 'timeStamp') final String? timeStamp,
    final String? httpStatus,
  }) = _ApiException;

  factory ApiException.fromJson(Map<String, dynamic> json) =>
      _$ApiExceptionFromJson(json);
}
