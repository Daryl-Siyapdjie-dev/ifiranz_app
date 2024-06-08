import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/cashout_model.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/initiate_request.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/transaction_request.dart';
import 'package:ifiranz_client/src/features/client/payment/infrastructure/payment_remote_service.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_exception.dart';

import '../../../core/domain/paginated_response.dart';
import '../../home/domain/transaction_response.dart';
import '../domain/verify_transaction_request.dart';

class PaymentRepository {
  final PaymentRemoteService _paymentRemoteService;

  PaymentRepository(this._paymentRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<CashoutModel>>>
      getOperators() async {
    try {
      final response = await _paymentRemoteService.getOperators();

      return right(
        await response.when(
          success: (res) => PaginatedResponse<CashoutModel>(
              data: (res!['record'] as List)
                  .map((e) => CashoutModel.fromJson(e))
                  .toList(),
              totalElements: res['totalPages'] ?? 0,
              totalPages: res['totalElements'] ?? 0),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  // Future<CashoutModel> getOperator() async {
  //   try {
  //     final response = await _paymentRemoteService.getOperator();

  //     return await response.when(
  //         success: (res) => CashoutModel.fromJson(res!['record']));
  //   } on ApiException catch (apiException) {
  //     throw ApiFailure.failure(apiException.msg);
  //   }
  // }

  Future<Either<ApiFailure, TransactionResponse>> initTrasact(
      InitiateRequest request) async {
    try {
      final response = await _paymentRemoteService.initTrasact(request);

      return right(await response.when(
          success: (res) => TransactionResponse.fromJson(res!['record'])));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, TransactionResponse>> finalise(
      TransactionRequest request) async {
    try {
      final response = await _paymentRemoteService.finalise(request);

      return right(await response.when(
          success: (res) => TransactionResponse.fromJson(res!['record'])));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, TransactionResponse>> verifyTransaction(
      VerifyTransactionRequest request) async {
    try {
      final response = await _paymentRemoteService.verifyTransaction(request);

      return right(await response.when(
          success: (res) => TransactionResponse.fromJson(res!['record'])));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}
