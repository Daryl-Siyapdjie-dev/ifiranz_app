import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/auth/register/domain/add_merchant_client_request.dart';
import 'package:ifiranz_client/src/features/auth/register/infrastructure/register_repository.dart';

import '../domain/add_client_request.dart';

class AdditionalInfoNotifier extends StateNotifier<AsyncValue<Client>> {
  
  final RegisterRepository _repositoryRepository;

  AdditionalInfoNotifier(this._repositoryRepository)
      : super(const AsyncLoading());

  Future registerUserAdditionalInfo({required AddClientRequest request}) async {
    state = const AsyncLoading();

    final failureOrSuccess = await _repositoryRepository
        .registerUserAdditionalInfo(request: request);

    state = failureOrSuccess.fold(
        (l) => AsyncError(l.message as Object, StackTrace.current),
        (r) => AsyncData(r));
  }

  Future addCustomer({required AddMerchantClientRequest request}) async {
    state = const AsyncLoading();

    final failureOrSuccess = await _repositoryRepository
        .addCostumer(request: request);

    state = failureOrSuccess.fold(
        (l) => AsyncError(l.message as Object, StackTrace.current),
        (r) => AsyncData(r));
  }
}
