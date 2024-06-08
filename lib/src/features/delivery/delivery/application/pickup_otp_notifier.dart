import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/domain/otp_request.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/features/delivery/orders/infrastructure/delivery_orders_repository.dart';

import '../../../client/delivery/application/delivery_orders_notifier.dart';

part 'pickup_otp_notifier.freezed.dart';

@freezed
class PickupState with _$PickupState {
  const PickupState._();
  const factory PickupState.initial() = _Initial;
  const factory PickupState.loading() = _Loading;
  const factory PickupState.otpSendSuccess(Records res) = _OTPSendSuccess;

  const factory PickupState.otpVerifiedSuccess(Records res) =
      _OTPVerifiedSuccess;

  const factory PickupState.successully() = _Successully;

  const factory PickupState.failed(String? message) = _Failed;
}

class PickupNotifier extends StateNotifier<PickupState> {
  final DeliveryOrdersRepository _repository;
  PickupNotifier(this._repository) : super(const PickupState.initial());

  Future<void> sendOtpToDeliveryOrder(
    int id,
  ) async {
    state = const PickupState.loading();
    final resultOrFailure = await _repository.sendOtpToDeliveryOrder(id);

    state = resultOrFailure.fold(
      (l) => PickupState.failed(l.message),
      (r) => PickupState.otpSendSuccess(r),
    );
  }

  Future<void> validateOtpToDelivery(OtpRequest request) async {
    final resultOrFailure =
        await _repository.validateOtpToDeliveryOrder(request);

    state = resultOrFailure.fold((l) => PickupState.failed(l.message),
        (r) => PickupState.otpVerifiedSuccess(r));
  }

  Future<void> updateDeliveryOrder(Records request) async {
    state = const PickupState.loading();
    final resultOrFailure = await _repository.updateDeliveryOrder(request.id!);

    state = resultOrFailure.fold(
      (l) => PickupState.failed(l.message),
      (r) => const PickupState.successully(),
    );
  }
}
