import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/products_repository.dart';

class GetProductDetailNotifier extends StateNotifier<AsyncValue<ProductModel>> {
  final ProductsRepository _producstRepository;

  GetProductDetailNotifier(this._producstRepository)
      : super(const AsyncLoading());

  Future fetchProduct(String code) async {
    if (!state.hasValue) {
      state = const AsyncLoading();
    }
    final failureOrSuccess = await _producstRepository.getProduit(code);

    state = failureOrSuccess
        .fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) {
      return AsyncData(r);
    });
  }
}
