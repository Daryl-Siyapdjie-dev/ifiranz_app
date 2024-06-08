import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/application/cart_notifier.dart';
import 'package:ifiranz_client/src/features/client/home/domain/create_command_request.dart';
import 'package:ifiranz_client/src/features/client/home/domain/create_command_response.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/products_repository.dart';

import '../domain/current_cart_response.dart';

class CreateCommandPoductsNotifier
    extends StateNotifier<AsyncValue<CreateCommandResponse>> {
  final ProductsRepository _producstRepository;
  final CartNotifier _cartNotifier;

  CreateCommandPoductsNotifier(this._producstRepository, this._cartNotifier)
      : super(const AsyncLoading());

  Future createCommand(CreateCommandRequest request) async {
    state = const AsyncLoading();

    final failureOrSuccess = await _producstRepository.createCommande(request);

    state = failureOrSuccess
        .fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) {
      _cartNotifier.getCurrentCart();
      return AsyncData(r);
    });
  }

  Future updateCommand(CurrentCartResponse request) async {
    state = const AsyncLoading();

    final failureOrSuccess = await _producstRepository.updateCommande(request);

    state = failureOrSuccess
        .fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) {
      _cartNotifier.getCurrentCart();
      return AsyncData(r);
    });
  }

  Future deleteCommand(CurrentCartResponse request) async {
    state = const AsyncLoading();

    final failureOrSuccess = await _producstRepository.deleteCommande(request);

    state = failureOrSuccess
        .fold((l) => AsyncError(l.message as Object, StackTrace.current), (r) {
      _cartNotifier.getCurrentCart();
      return AsyncData(r);
    });
  }
}
