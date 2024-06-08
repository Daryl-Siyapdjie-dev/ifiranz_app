import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/products_repository.dart';

class MakeNotationPoductsNotifier extends StateNotifier<AsyncValue<Unit>> {
  final ProductsRepository _producstRepository;

  MakeNotationPoductsNotifier(this._producstRepository) : super(const AsyncLoading());

  Future makeNotation(int idArticle, int note, String comment) async {
    state = const AsyncLoading();

    final failureOrSuccess = await _producstRepository.makeNotation(idArticle, note, comment);

    state = failureOrSuccess.fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) {
      return AsyncData(r);
    });
  }
}
