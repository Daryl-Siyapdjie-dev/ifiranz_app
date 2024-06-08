import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/client/home/domain/current_cart_response.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/merchant/orders/infrastructure/merchand_orders_remote_service.dart';

import '../../../core/domain/paginated_response.dart';
import '../../../core/infrastructure/utils/api_exception.dart';

class MerchandOrdersRepository {
  final MerchandOrdersRemoteService _productRemoteService;

  MerchandOrdersRepository(this._productRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<CurrentCartResponse>>> getListProducts(PaginatedRequest params,
      [List<FilterOptional> request = const []]) async {
    try {
      final response = await _productRemoteService.getAllOrders(params, [
        FilterOptional.fromJson({"key": "pourMarchand", "value": SharedPref.getEmail(), "type": "EQUAL", "applyAnd": true}),
        ...request
      ]);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<CurrentCartResponse>(
              data: (res!['records'] as List).map((e) => CurrentCartResponse.fromJson(e)).toList(),
              totalElements: res['totalPages'],
              totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, PaginatedResponse<CurrentCartResponse>>> getAllOrders(PaginatedRequest params,
      [List<FilterOptional> request = const []]) async {
    try {
      final response = await _productRemoteService.getAllOrders(params, request);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<CurrentCartResponse>(
              data: (res!['records'] as List).map((e) => CurrentCartResponse.fromJson(e)).toList(),
              totalElements: res['totalPages'],
              totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<CurrentCartResponse> getOrder(int id) async {
    final response = await _productRemoteService.getOrder(id);
    return await response.when(success: (res) => CurrentCartResponse.fromJson(res!['record']));
  }

  Future<Either<ApiFailure, PaginatedResponse<CurrentCartResponse>>> getOrdersState(
    PaginatedRequest params,
  ) async {
    try {
      final response = await _productRemoteService.getAllOrders(params, [
        FilterOptional.fromJson({"key": "pourMarchand", "value": SharedPref.getEmail(), "type": "EQUAL", "applyAnd": true}),
        FilterOptional.fromJson({"key": "dateCreate", "value": "01/01/2024", "value1": "12/01/2024", "type": "BETWEEN"}),
      ]);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<CurrentCartResponse>(
              data: (res!['records'] as List).map((e) => CurrentCartResponse.fromJson(e)).toList(),
              totalElements: res['totalPages'],
              totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}
