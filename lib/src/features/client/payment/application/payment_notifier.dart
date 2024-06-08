import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ifiranz_client/src/features/client/home/domain/transaction_response.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/cashout_model.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/initiate_request.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/transaction_request.dart';
import 'package:ifiranz_client/src/features/client/payment/infrastructure/payment_repository.dart';

import '../../../core/infrastructure/utils/common_import.dart';
import '../domain/verify_transaction_request.dart';

part 'payment_notifier.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.loading() = _Loading;
  const factory PaymentState.initiated({required TransactionResponse quote}) =
      _Initiated;
  const factory PaymentState.finalyse({required TransactionResponse res}) =
      _LoadingLinalyse;
  const factory PaymentState.success() = _Sucess;
  const factory PaymentState.failed(String? message) = _Failed;
  const factory PaymentState.error(String? message) = _Error;
}

class PaymentNotifier extends StateNotifier<PaymentState> {
  final PaymentRepository _paymentRepository;

  PaymentNotifier(this._paymentRepository)
      : super(const PaymentState.initial());

  Future initTranstion(InitiateRequest request) async {
    state = const PaymentState.loading();
    final res = await _paymentRepository.initTrasact(request);
    res.fold((l) => state = PaymentState.failed(l.message), (r) {
      return state = PaymentState.initiated(quote: r);
    });
  }

  Future finalyse(TransactionRequest request) async {
    final res = await _paymentRepository.finalise(request);

    res.fold((l) => state = PaymentState.failed(l.message), (r) async {
      state = PaymentState.finalyse(res: r);
    });
  }

  Future verifyTransaction(VerifyTransactionRequest request) async {
    final res = await _paymentRepository.verifyTransaction(request);

    res.fold((l) => state = PaymentState.failed(l.message), (r) async {
      if (r.status == "SUCCESS") {
        return state = const PaymentState.success();
      } else if (r.status == "PENDING") {
        state = const PaymentState.error("Transaction pending");
        Future.delayed(const Duration(seconds: 3), () {
          state = const PaymentState.initial();
        });
      } else if (r.status == "FAILED" || r.status == "ERRORED") {
        state = const PaymentState.error("Transaction échoué");
        Future.delayed(const Duration(seconds: 3), () {
          state = const PaymentState.initial();
        });
      }
    });
  }
}
