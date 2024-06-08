import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/domain/create_command_request.dart';
import 'package:ifiranz_client/src/features/client/home/domain/current_cart_response.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/products_repository.dart';

class CartNotifier extends StateNotifier<CurrentCartResponse> {
  CartNotifier(this._producstRepository)
      : super(CurrentCartResponse(articles: [])) {
    getCurrentCart();
  }

  final ProductsRepository _producstRepository;

  void getCurrentCart() async {
    final res = await _producstRepository.currentCart();
    res.fold((l) => null, (r) => state = r);
  }

  void updateCart(CurrentCartResponse cart) async {
    state = cart;
  }

  void addItem(OrderArticle order) {
    final existingIndex = state.articles.contains(order);

    if (!existingIndex) {
      state = state.copyWith(articles: List.from(state.articles)..add(order));
    }
  }

  Future incrementItem(OrderArticle order) async {
    if (order.quantite == 100) return;
    final updatedState = List<OrderArticle>.from(state.articles);
    final existingIndex = updatedState
        .indexWhere((element) => element.article?.id == order.article?.id);
    if (existingIndex != -1) {
      updatedState[existingIndex] =
          OrderArticle(article: order.article, quantite: order.quantite! + 1);

      final succesOrFailedRes = await _producstRepository
          .updateCommande(state.copyWith(articles: updatedState));

      succesOrFailedRes.fold(
          (l) => state, (r) => state = state.copyWith(articles: updatedState));
    }
  }

  Future decrementItem(OrderArticle order) async {
    if (order.quantite == 1) return;

    final updatedState = List<OrderArticle>.from(state.articles);
    final existingIndex = updatedState
        .indexWhere((element) => element.article?.id == order.article?.id);
    if (existingIndex != -1) {
      updatedState[existingIndex] =
          OrderArticle(article: order.article, quantite: order.quantite! - 1);

      final succesOrFailedRes = await _producstRepository
          .updateCommande(state.copyWith(articles: updatedState));
      succesOrFailedRes.fold(
          (l) => state, (r) => state = state.copyWith(articles: updatedState));
    }
  }

  Future removeItem(OrderArticle order) async {
    final existingIndex = state.articles
        .indexWhere((element) => element.article?.id == order.article?.id);

    if (existingIndex != -1) {
      final succesOrFailedRes = await _producstRepository.updateCommande(
          state.copyWith(articles: List.from(state.articles)..remove(order)));
      succesOrFailedRes.fold(
          (l) => state,
          (r) => state = state.copyWith(
              articles: List.from(state.articles)..remove(order)));
    }
  }

  Future clearCart(CurrentCartResponse card) async {
    final succesOrFailedRes =
        await _producstRepository.deleteCommande(state.copyWith(articles: []));
    succesOrFailedRes.fold(
        (l) => state, (r) => state = CurrentCartResponse(articles: []));
  }
}
