import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/domain/paginated_request.dart';
import '../../../core/domain/paginated_response.dart';
import '../domain/filter_optional.dart';
import '../domain/product_model.dart';
import '../infrastructure/merchant_products_repository.dart';

class MarchantProductsNotifier
    extends StateNotifier<AsyncValue<PaginatedResponse<ProductModel>>> {
  final MerchantProductsRepository _merchantProducstRepository;

  MarchantProductsNotifier(this._merchantProducstRepository)
      : super(const AsyncLoading());

  Future fetchMerchantProducts(
      List<FilterOptional> filter, PaginatedRequest params, String merchantId,
      {bool isMore = false}) async {
    if (state.value?.isLoadingMore == true) return;
    if (!state.hasValue ||
        (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
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

    final failureOrSuccess = await _merchantProducstRepository
        .getMarchantProducts(filter, params, merchantId);

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

  // Future findProductByDesignation(List<FilterOptional> filter) async {
  //   if (!state.hasValue ||
  //       (state.hasValue && (state.value?.data.isEmpty ?? false))) {
  //     state = const AsyncLoading();
  //   }

  //   final failureOrSuccess =
  //       await _merchantProducstRepository.findProductByDesignation(filter);

  //   state = failureOrSuccess
  //       .fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) {
  //     return AsyncData(r);
  //   });
  // }
}
