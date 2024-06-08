import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/auth/core/infrastructure/firebase_authenticator_repository.dart';
import 'package:ifiranz_client/src/features/auth/register/application/additional_info_notifier.dart';
import 'package:ifiranz_client/src/features/auth/register/domain/profile_response.dart';
import '../../../core/shared/providers.dart';
import '../application/register_notifier.dart';
import '../infrastructure/register_remote_service.dart';
import '../infrastructure/register_repository.dart';

final registerRemoteServiceProvider = Provider<RegisterRemoteService>((ref) {
  return RegisterRemoteService(
      ref.watch(urlBuilderProvider), ref.watch(dioProvider));
});

final registerRepositoryProvider = Provider<RegisterRepository>((ref) {
  return RegisterRepository(ref.watch(registerRemoteServiceProvider));
});

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final firebaseAuthenticatorRepository =
    Provider<FirebaseAuthenticatorRepository>((ref) {
  return FirebaseAuthenticatorRepository(
    ref.watch(firebaseAuthProvider),
  );
});

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier(ref.watch(registerRepositoryProvider),
      ref.watch(firebaseAuthenticatorRepository));
});

final profileFutureProvider =
    FutureProvider.autoDispose<ProfileResponse>((ref) {
  if (!ref.state.hasError) {
    ref.keepAlive();
  }
  return ref.watch(registerRepositoryProvider).findProfilByName();
});

final additionalInfoNotifierProvider = StateNotifierProvider.autoDispose<
    AdditionalInfoNotifier, AsyncValue<Client>>((ref) {
  return AdditionalInfoNotifier(
    ref.watch(registerRepositoryProvider),
  );
});
