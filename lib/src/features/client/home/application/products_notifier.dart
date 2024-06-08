import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/products_repository.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';

import '../domain/filter_optional.dart';

class ProductsNotifier extends StateNotifier<AsyncValue<PaginatedResponse<ProductModel>>> {
  final ProductsRepository _producstRepository;

  ProductsNotifier(this._producstRepository) : super(const AsyncLoading());

  Future fetchProducts(PaginatedRequest params, List<FilterOptional> requests, {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue || (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else if (!isMore) {
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<ProductModel>);
    }

    if (isMore) {
      state =
          AsyncData(state.value!.copyWith(hasErrorOnLoadMore: false, isLoadingMore: true, isRefetching: false) as PaginatedResponse<ProductModel>);
    }

    final failureOrSuccess = await _producstRepository.getListProducts(params, requests);

    state = failureOrSuccess.fold(
      (l) => isMore
          ? AsyncData(state.value!.copyWith(hasErrorOnLoadMore: true, isRefetching: false, hasMore: false, isLoadingMore: false)
              as PaginatedResponse<ProductModel>)
          : AsyncError(l.message as Object, StackTrace.current),
      (r) {
        if (isMore) {
          PaginatedResponse<ProductModel> oldStatement = state.value!;

          List<ProductModel> oldData = oldStatement.data as List<ProductModel>;

          List<ProductModel> newData = [...oldData, ...(r.data as List<ProductModel>)];

          return isMore
              ? AsyncData(
                  r.copyWith(
                      data: newData,
                      hasMore: ((r.data.length % params.size == 0) && r.data.isNotEmpty),
                      isLoadingMore: false,
                      isRefetching: false) as PaginatedResponse<ProductModel>,
                )
              : AsyncData(r);
        }

        return AsyncData(
          r.copyWith(isLoadingMore: false, hasMore: ((r.data.length % params.size == 0) && r.data.isNotEmpty)) as PaginatedResponse<ProductModel>,
        );
      },
    );
  }
}
