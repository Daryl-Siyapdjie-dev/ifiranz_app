import 'package:freezed_annotation/freezed_annotation.dart';
part 'paginated_response.freezed.dart';

@freezed
class PaginatedResponse<T> with _$PaginatedResponse {
  factory PaginatedResponse({
    required List<T> data,
    required int totalElements,
    required int totalPages,
    @Default(false) bool hasErrorOnLoadMore,
    @Default(false) bool hasMore,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isRefetching,
    @Default(false) bool isActionLoading,
    String? actionError,
  }) = _PaginatedResponse;
}
