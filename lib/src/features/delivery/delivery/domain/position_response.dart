import 'package:freezed_annotation/freezed_annotation.dart';

part 'position_response.freezed.dart';
part 'position_response.g.dart';

@freezed
class PositionResponse with _$PositionResponse {
  const factory PositionResponse({
    required double latitude,
    required double longitude,
    required String status,
  }) = _PositionResponse;

  factory PositionResponse.fromJson(Map<String, dynamic> json) => _$PositionResponseFromJson(json);
}
