import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/payment/application/payment_notifier.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/cashout_model.dart';
import 'package:ifiranz_client/src/features/client/payment/infrastructure/payment_remote_service.dart';
import 'package:ifiranz_client/src/features/client/payment/infrastructure/payment_repository.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';

import '../../home/application/payment_merchant_notifier.dart';

final paymentRemoteServiceProvider = Provider<PaymentRemoteService>((ref) {
  return PaymentRemoteService(
      ref.watch(urlBuilderProvider), ref.watch(dioProvider));
});

final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  return PaymentRepository(ref.watch(paymentRemoteServiceProvider));
});

// final paymentMerchantsNotifier =
//     FutureProvider.autoDispose((ref) {
//   return PaymentNotifier(
//     ref.watch(paymentRepositoryProvider),
//   );
// });

final paymentProvider =
    StateNotifierProvider<PaymentNotifier, PaymentState>((ref) {
  return PaymentNotifier(ref.watch(paymentRepositoryProvider));
});

final paymentMerchantsNotifier =
    StateNotifierProvider.autoDispose<PaymentMerchantsNotifier, AsyncValue>(
        (ref) {
  ref.keepAlive();
  return PaymentMerchantsNotifier(
    ref.watch(paymentRepositoryProvider),
  );
});
