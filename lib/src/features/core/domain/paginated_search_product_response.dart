import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_search_product_response.freezed.dart';

@freezed
class PaginatedSearchProductResponse<T> with _$PaginatedSearchProductResponse {
  factory PaginatedSearchProductResponse({
    required List<T> data,
    required int totalElements,
    required int totalPages,
    String? actionError,
  }) = _PaginatedSearchProductResponse;
}
