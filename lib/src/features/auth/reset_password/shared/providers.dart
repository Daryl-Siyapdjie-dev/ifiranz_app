import 'package:ifiranz_client/src/features/auth/reset_password/application/reset_password_notifier.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/infrastructure/reset_password_remote_service.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/infrastructure/reset_password_repository.dart';
import 'package:ifiranz_client/src/features/auth/sign_in/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';

import '../../../core/infrastructure/utils/common_import.dart';

final resetPasswordRemoteServiceProvider =
    Provider<ResetPasswordRemoteService>((ref) {
  return ResetPasswordRemoteService(ref.watch(urlBuilderProvider),
      ref.watch(dioProvider), ref.watch(userLocalCredentialsRepository));
});

final resetPasswordRepositoryProvider =
    Provider<ResetPasswordRepository>((ref) {
  return ResetPasswordRepository(ref.watch(resetPasswordRemoteServiceProvider));
});

final resetPasswordNotifierProvider =
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>((ref) {
  return ResetPasswordNotifier(ref.watch(resetPasswordRepositoryProvider));
});
