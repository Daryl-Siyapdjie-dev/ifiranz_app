import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/home/domain/quartier.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/products_repository.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';

class FindQuartierPoductsNotifier extends StateNotifier<AsyncValue<PaginatedResponse<Quartier>>> {
  final ProductsRepository _producstRepository;

  FindQuartierPoductsNotifier(this._producstRepository) : super(const AsyncLoading());

  Future findProductQuartier([List<FilterOptional>? filter]) async {
    state = const AsyncLoading();

    final failureOrSuccess = await _producstRepository.findFilterAllQuartier(filter);

    state = failureOrSuccess.fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) {
      return AsyncData(r);
    });
  }
}
