import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/products/aplication/marchand_products_notifier.dart';
import 'package:ifiranz_client/src/features/merchant/products/infrastructure/merchand_products_remote_service.dart';

import '../../../core/domain/paginated_response.dart';
import '../infrastructure/merchand_products_repository.dart';

final merchandProductsRemoteService = Provider<MerchandProductsRemoteService>((ref) {
  return MerchandProductsRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final merchandProductsRepositoryProvider = Provider<ProductsRepository>((ref) {
  return ProductsRepository(ref.watch(merchandProductsRemoteService));
});

final merchandProductsNotifierProvider =
    StateNotifierProvider.autoDispose<MerchandProductNotifier, AsyncValue<PaginatedResponse<ProductModel>>>((ref) {
  ref.keepAlive();
  return MerchandProductNotifier(
    ref.watch(merchandProductsRepositoryProvider),
  );
});

final findByIdProductsNotifierProvider = FutureProvider.autoDispose.family<ProductModel, int>((ref, id) {
  if (!ref.state.hasError) {
    ref.keepAlive();
  }
  return ref.watch(merchandProductsRepositoryProvider).findById(id);
});
