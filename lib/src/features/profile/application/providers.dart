import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/profile/application/profile_notifier.dart';
import '../../core/domain/type_defs.dart';
import '../../core/infrastructure/utils/url_builder.dart';
import '../../core/shared/providers.dart';
import '../infrastructure/profile_remote_service.dart';
import '../infrastructure/profile_repository.dart';
import '../../auth/infrastructure/auth_service.dart';



final profileRemoteService =
Provider<ProfileRemoteService>((ref) {
  return ProfileRemoteService(
    ref.watch(urlBuilderProvider),
    ref.watch(dioProvider),
  );
});

final profileRepository =
Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref.watch(profileRemoteService));
});


final profileNotifierProvider = StateNotifierProvider<ProfileNotifier, AsyncValue<void>>((ref) {
  final repository = ref.watch(profileRepository);
  return ProfileNotifier(repository);
});

