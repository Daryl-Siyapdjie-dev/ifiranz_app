import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_request.freezed.dart';
part 'paginated_request.g.dart';

@freezed
class PaginatedRequest with _$PaginatedRequest {
  factory PaginatedRequest({@Default(10) int size, @Default(0) int page}) =
      _PaginatedRequest;

  factory PaginatedRequest.fromJson(Map<String, dynamic> json) =>
      _$PaginatedRequestFromJson(json);
}
