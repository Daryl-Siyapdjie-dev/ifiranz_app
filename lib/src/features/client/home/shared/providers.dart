import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/application/cart_notifier.dart';
import 'package:ifiranz_client/src/features/client/home/application/craete_command_notifier.dart';
import 'package:ifiranz_client/src/features/client/home/application/filter_products_notifier.dart';
import 'package:ifiranz_client/src/features/client/home/application/find_quartier_notifier.dart';
import 'package:ifiranz_client/src/features/client/home/application/get_product_details_notifier.dart';
import 'package:ifiranz_client/src/features/client/home/application/get_top_10_products_notifier.dart';
import 'package:ifiranz_client/src/features/client/home/application/make_notation.dart';
import 'package:ifiranz_client/src/features/client/home/application/merchant_products_notifier.dart';
import 'package:ifiranz_client/src/features/client/home/application/products_notifier.dart';
import 'package:ifiranz_client/src/features/client/home/application/promotion_notifier.dart';
import 'package:ifiranz_client/src/features/client/home/domain/create_command_response.dart';
import 'package:ifiranz_client/src/features/client/home/domain/current_cart_response.dart';
import 'package:ifiranz_client/src/features/client/home/domain/infrastructur_model.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/client/home/domain/quartier.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/infrastructurs_remote_service.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/infrastructurs_repository.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/products_remote_service.dart';
import 'package:ifiranz_client/src/features/client/home/infrastructure/products_repository.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';

import '../../../auth/core/shared/provider.dart';
import '../application/find_all_marchand.dart';
import '../application/infrastructur_notifier.dart';
import '../infrastructure/merchant_products_remote_service.dart';
import '../infrastructure/merchant_products_repository.dart';

final productsRemoteService = Provider<ProductsRemoteService>((ref) {
  return ProductsRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});
final merchantProductsRemoteService = Provider<MerchantProductsRemoteService>((ref) {
  return MerchantProductsRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final infrasRemoteService = Provider<InfrastructursRemoteService>((ref) {
  return InfrastructursRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  return ProductsRepository(ref.watch(productsRemoteService));
});

final merchantProductsRepositoryProvider = Provider<MerchantProductsRepository>((ref) {
  return MerchantProductsRepository(ref.watch(merchantProductsRemoteService));
});

final infrasRepositoryProvider = Provider<InfrastructursRepository>((ref) {
  return InfrastructursRepository(
      ref.watch(infrasRemoteService), ref.watch(productsRemoteService));
});

final productsNotifierProvider = StateNotifierProvider.autoDispose<
    ProductsNotifier, AsyncValue<PaginatedResponse<ProductModel>>>((ref) {
  ref.keepAlive();
  return ProductsNotifier(
    ref.watch(productsRepositoryProvider),
  );
});

final restaurantsNotifierProvider = StateNotifierProvider.autoDispose<
    InfrastructursNotifier,
    AsyncValue<PaginatedResponse<InfrastructurModel>>>((ref) {
  ref.keepAlive();
  return InfrastructursNotifier(
    ref.watch(infrasRepositoryProvider),
  );
});

final shopsNotifierProvider = StateNotifierProvider.autoDispose<
    InfrastructursNotifier,
    AsyncValue<PaginatedResponse<InfrastructurModel>>>((ref) {
  ref.keepAlive();
  return InfrastructursNotifier(
    ref.watch(infrasRepositoryProvider),
  );
});

final supermarketNotifierProvider = StateNotifierProvider.autoDispose<
    InfrastructursNotifier,
    AsyncValue<PaginatedResponse<InfrastructurModel>>>((ref) {
  ref.keepAlive();
  return InfrastructursNotifier(
    ref.watch(infrasRepositoryProvider),
  );
});

// final promotionNotifierProvider = StateNotifierProvider.autoDispose<
//     InfrastructursNotifier,
//     AsyncValue<PaginatedResponse<InfrastructurModel>>>((ref) {
//   ref.keepAlive();
//   return InfrastructursNotifier(
//     ref.watch(infrasRepositoryProvider),
//   );
// });

final promotionnalProductsNotifierProvider = StateNotifierProvider.autoDispose<
    PromotionPoductsNotifier,
    AsyncValue<PaginatedResponse<ProductModel>>>((ref) {
  ref.keepAlive();
  return PromotionPoductsNotifier(
    ref.watch(productsRepositoryProvider),
  );
});

// final sendOtpToDeliveryOrderProvider =
//     FutureProvider.autoDispose.family<Records, String>((ref, code) {
//   if (!ref.state.hasError) {
//     ref.keepAlive();
//   }
//   return ref
//       .watch(deliveryOrdersRepositoryProvider)
//       .sendOtpToDeliveryOrder(code);
// });

final productNotifier =
    StateNotifierProvider.autoDispose<ProductsNotifier, AsyncValue>(
        (ref) {
  ref.keepAlive();
  return ProductsNotifier(
    ref.watch(productsRepositoryProvider),
  );
});

final merchantProductNotifier =
    StateNotifierProvider.autoDispose<MarchantProductsNotifier, AsyncValue>(
        (ref) {
  ref.keepAlive();
  return MarchantProductsNotifier(
    ref.watch(merchantProductsRepositoryProvider),
  );
});

final getTop10ProductsProductsNotifier = StateNotifierProvider.autoDispose<
    GetTop10ProductsProductsNotifier, AsyncValue>((ref) {
  ref.keepAlive();
  return GetTop10ProductsProductsNotifier(
    ref.watch(productsRepositoryProvider),
  );
});

final getProductDetailNotifier = StateNotifierProvider.autoDispose<
    GetProductDetailNotifier, AsyncValue<ProductModel>>((ref) {
  ref.keepAlive();
  return GetProductDetailNotifier(
    ref.watch(productsRepositoryProvider),
  );
});

final findByDesignationPoductsProvider = StateNotifierProvider.autoDispose<
    FindByDesignationPoductsNotifier, AsyncValue>((ref) {
  ref.keepAlive();
  return FindByDesignationPoductsNotifier(
    ref.watch(productsRepositoryProvider),
  );
});

final makeNotationPoductsNotifierProvider = StateNotifierProvider.autoDispose<
    MakeNotationPoductsNotifier, AsyncValue<Unit>>((ref) {
  return MakeNotationPoductsNotifier(
    ref.watch(productsRepositoryProvider),
  );
});

final findQuartierPoductsProvider = StateNotifierProvider.autoDispose<
    FindQuartierPoductsNotifier,
    AsyncValue<PaginatedResponse<Quartier>>>((ref) {
  ref.keepAlive();
  return FindQuartierPoductsNotifier(
    ref.watch(productsRepositoryProvider),
  );
});

final createCommandPoductsNotifierProvider = StateNotifierProvider.autoDispose<
    CreateCommandPoductsNotifier, AsyncValue<CreateCommandResponse>>((ref) {
  return CreateCommandPoductsNotifier(
      ref.watch(productsRepositoryProvider), ref.watch(cartProvider.notifier));
});

final cartProvider =
    StateNotifierProvider<CartNotifier, CurrentCartResponse>((ref) {
  return CartNotifier(
    ref.watch(productsRepositoryProvider),
  );
});

final findAllMarchandNotifier = StateNotifierProvider.autoDispose<
    FindAllMarchandPoductsNotifier, AsyncValue<List<Merchant>>>((ref) {
  ref.keepAlive();
  return FindAllMarchandPoductsNotifier(
    ref.watch(getCurrentUserRepositoryProvider),
  );
});


final paymentMethodNotifierProvider = StateNotifierProvider.autoDispose<
    ProductsNotifier, AsyncValue<PaginatedResponse<ProductModel>>>((ref) {
  ref.keepAlive();
  return ProductsNotifier(
    ref.watch(productsRepositoryProvider),
  );
});
