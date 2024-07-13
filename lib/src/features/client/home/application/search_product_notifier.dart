import '../../../core/domain/paginated_request.dart';
import '../../../core/domain/paginated_response.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../domain/product_model.dart';
import '../infrastructure/products_repository.dart';

class SearchProductNotifier
    extends StateNotifier<AsyncValue<PaginatedResponse<ProductModel>>> {
  final ProductsRepository _producstRepository;

  SearchProductNotifier(this._producstRepository) : super(const AsyncLoading());

  Future findProductByName(PaginatedRequest params, String productName,
      {bool isMore = false}) async {
    debugPrint("SEARCH PRODUCT*******************");

    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue ||
        (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<ProductModel>);
    }

    if (isMore) {
      state = AsyncData(state.value!.copyWith(
          hasErrorOnLoadMore: false,
          isLoadingMore: true,
          isRefetching: false) as PaginatedResponse<ProductModel>);
    }

    final failureOrSuccess =
        await _producstRepository.findProductByName(params, productName);

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(
              hasErrorOnLoadMore: true,
              isRefetching: false,
              hasMore: false,
              isLoadingMore: false) as PaginatedResponse<ProductModel>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<ProductModel> oldStatement = state.value!;

          List<ProductModel> oldData = oldStatement.data as List<ProductModel>;

          List<ProductModel> newData = [
            ...oldData,
            ...(r.data as List<ProductModel>)
          ];

          return isMore
              ? AsyncData(
                  r.copyWith(
                      data: newData,
                      hasMore: ((r.data.length % params.size == 0) &&
                          r.data.isNotEmpty),
                      isLoadingMore: false,
                      isRefetching: false) as PaginatedResponse<ProductModel>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(
              isLoadingMore: false,
              hasMore: ((r.data.length % params.size == 0) &&
                  r.data.isNotEmpty)) as PaginatedResponse<ProductModel>,
        );
      },
    );
  }
}
