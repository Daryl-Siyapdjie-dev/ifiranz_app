import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/profile/application/providers.dart';

import '../../auth/infrastructure/auth_service.dart';
import '../infrastructure/profile_repository.dart';

class ProfileNotifier extends StateNotifier<AsyncValue<void>> {
  final ProfileRepository _repository;

  ProfileNotifier(this._repository) : super(const AsyncData(null));

  Future<void> deleteAccount() async {

      state = const AsyncLoading();
     final res =  await _repository.deleteAccount(SharedPref.getClientLocalUser()?.idClient ?? SharedPref.getLocalDeliver()?.shipperId ??SharedPref.getLocalUser()!.merchantId!);

    state = res.fold((l) =>AsyncError(l.message.toString(),StackTrace.current), (r) => const AsyncData(null));

  }
}

