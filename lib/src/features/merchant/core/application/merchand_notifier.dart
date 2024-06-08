import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ifiranz_client/src/features/auth/core/infrastructure/user_repository.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';

import '../../../core/infrastructure/utils/common_import.dart';

part 'merchand_notifier.freezed.dart';

@freezed
class MerchandState with _$MerchandState {
  const MerchandState._();
  const factory MerchandState.initial() = _Initial;
  const factory MerchandState.loading() = _Loading;

  const factory MerchandState.successully() = _Successully;

  const factory MerchandState.failed(String? message) = _Failed;
}

class MerchandNotifier extends StateNotifier<MerchandState> {
  final GetCurrentUserRepository _repository;
  MerchandNotifier(this._repository) : super(const MerchandState.initial());

  Future update(Merchant request) async {
    state = const MerchandState.loading();
    final resOrfailed = await _repository.updateMerchand(request);
    resOrfailed.fold((l) => state = MerchandState.failed(l.message), (r) => state = const MerchandState.successully());
  }

  Future updateProfile({required int id, required File image}) async {
    state = const MerchandState.loading();
    final resOrfailed = await _repository.updateProfileMerchand(id: id, image: image);
    resOrfailed.fold((l) => state = MerchandState.failed(l.message), (r) => state = const MerchandState.successully());
  }
}
