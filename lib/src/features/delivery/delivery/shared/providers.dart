import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/application/pickup_otp_notifier.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/infrastructure/remote_service/firestore_service.dart';
import 'package:ifiranz_client/src/features/delivery/orders/shared/providers.dart';

final pickupNotifierProvider = StateNotifierProvider<PickupNotifier, PickupState>((ref) {
  return PickupNotifier(ref.watch(deliveryOrdersRepositoryProvider));
});

final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});
