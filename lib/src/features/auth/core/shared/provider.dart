import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/auth/core/application/get_deliver_provider.dart';
import 'package:ifiranz_client/src/features/auth/core/application/get_marchand_provider.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/auth/core/infrastructure/user_repository.dart';
import 'package:ifiranz_client/src/features/auth/core/infrastructure/user_service.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';

import '../application/get_client_provider.dart';

final getCurrentUserRemoteServiceProvider =
    Provider<GetCurrentUserRemoteService>((ref) {
  return GetCurrentUserRemoteService(
      ref.watch(urlBuilderProvider), ref.watch(dioProvider));
});

final getCurrentUserRepositoryProvider =
    Provider<GetCurrentUserRepository>((ref) {
  return GetCurrentUserRepository(
      ref.watch(getCurrentUserRemoteServiceProvider));
});

final getCurrentClientProvider =
    StateNotifierProvider<CurrentClientNotifier, AsyncValue<Client>>((ref) {
  return CurrentClientNotifier(ref.watch(getCurrentUserRepositoryProvider));
});

final findMarchandByIdProvider =
    FutureProvider.autoDispose.family<Merchant, int>((ref, id) {
  if (!ref.state.hasError) {
    ref.keepAlive();
  }
  return ref.watch(getCurrentUserRepositoryProvider).findMerchandById(id);
});

final currentMarchandNotifierProvider =
    StateNotifierProvider<CurrentMarchandNotifier, AsyncValue<Merchant>>((ref) {
  return CurrentMarchandNotifier(ref.watch(getCurrentUserRepositoryProvider));
});

final currentDeliverNotifierProvider =
    StateNotifierProvider<CurrentLivreurNotifier, AsyncValue<Livreur>>((ref) {
  return CurrentLivreurNotifier(ref.watch(getCurrentUserRepositoryProvider));
});
