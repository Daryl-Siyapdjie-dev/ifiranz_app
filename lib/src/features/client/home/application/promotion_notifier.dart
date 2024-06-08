import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/products_repository.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';

import '../../../core/domain/paginated_request.dart';
import '../domain/product_model.dart';

class PromotionPoductsNotifier extends StateNotifier<AsyncValue<PaginatedResponse<ProductModel>>> {
  final ProductsRepository _producstRepository;

  PromotionPoductsNotifier(this._producstRepository) : super(const AsyncLoading());

  Future findPromotions(List<FilterOptional> filter) async {
    if (state is! AsyncData) {
      state = const AsyncLoading();
    }

    final failureOrSuccess = await _producstRepository.getListProducts(PaginatedRequest(size: 20), filter);

    state = failureOrSuccess.fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) {
      return AsyncData(r);
    });
  }
}
