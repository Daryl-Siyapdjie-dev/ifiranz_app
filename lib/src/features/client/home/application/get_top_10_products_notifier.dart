import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/products_repository.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';

class GetTop10ProductsProductsNotifier
    extends StateNotifier<AsyncValue<PaginatedResponse<ProductModel>>> {
  final ProductsRepository _producstRepository;

  GetTop10ProductsProductsNotifier(this._producstRepository)
      : super(const AsyncLoading());

  Future fetchProducts() async {
    if (!state.hasValue ||
        (state.hasValue && (state.value?.data.isEmpty ?? false))) {
      state = const AsyncLoading();
    } else {
      if (!state.hasValue) return;
      state = AsyncData(state.value!.copyWith(
        isRefetching: true,
      ) as PaginatedResponse<ProductModel>);
    }

    final failureOrSuccess = await _producstRepository.getTop10Products();

    state = failureOrSuccess
        .fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) {
      return AsyncData(
          r.copyWith(isRefetching: false) as PaginatedResponse<ProductModel>);
    });
  }
}
