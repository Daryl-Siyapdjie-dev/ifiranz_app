import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/initiate_request.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/transaction_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/url_builder.dart';

import '../../../core/domain/type_defs.dart';
import '../../../core/infrastructure/utils/api_response.dart';
import '../../../core/infrastructure/utils/handle_api_call.dart';
import '../domain/verify_transaction_request.dart';

class PaymentRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  PaymentRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getOperators() async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(_urlBuilder.buildGetOperator()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> initTrasact(InitiateRequest request) async {
    log(request.toJson().toString());

    return handleApiCall<ApiResponse<Json>>(
      () async =>
          _dio.post(_urlBuilder.buildInitTrasact(), data: request.toJson()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> finalise(TransactionRequest request) async {
    log(request.toJson().toString());

    return handleApiCall<ApiResponse<Json>>(
      () async =>
          _dio.post(_urlBuilder.buildFinalise(), data: request.toJson()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> verifyTransaction(
      VerifyTransactionRequest request) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.buildVerifyTransaction(),
          data: request.toJson()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}
