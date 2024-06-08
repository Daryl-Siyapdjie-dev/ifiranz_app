import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/products_repository.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';

class FindByDesignationPoductsNotifier extends StateNotifier<AsyncValue<PaginatedResponse<ProductModel>>> {
  final ProductsRepository _producstRepository;

  FindByDesignationPoductsNotifier(this._producstRepository) : super(const AsyncLoading());

  Future findProductByDesignation(List<FilterOptional> filter) async {
    state = const AsyncLoading();

    final failureOrSuccess = await _producstRepository.findProductByDesignation(filter);

    state = failureOrSuccess.fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) {
      return AsyncData(r);
    });
  }
}
