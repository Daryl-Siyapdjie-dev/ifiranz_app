import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_exception.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/domain/otp_request.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/features/delivery/orders/infrastructure/delivery_orders_remote_service.dart';

import '../../../client/home/domain/filter_optional.dart';

class DeliveryOrdersRepository {
  final DeliveryOrdersRemoteService _deliveryRemoteService;

  DeliveryOrdersRepository(this._deliveryRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<Records>>> getListDeliveryOrders(
    PaginatedRequest params,
  ) async {
    try {
      final response = await _deliveryRemoteService.getListDeliveryOrders(params);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<Records>(data: (res!['records'] as List).map((e) => Records.fromJson(e)).toList(), totalElements: res['totalPages'], totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, PaginatedResponse<Records>>> filterOrders(List<FilterOptional> request, PaginatedRequest params) async {
    try {
      final response = await _deliveryRemoteService.filterOrders(request, params);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<Records>(data: (res!['records'] as List).map((e) => Records.fromJson(e)).toList(), totalElements: res['totalPages'], totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, PaginatedResponse<Records>>> getListDashboardDeliveryOrders(
    PaginatedRequest params,
  ) async {
    try {
      final response = await _deliveryRemoteService.getListDashboardDeliveryOrders(params);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<Records>(data: (res!['records'] as List).map((e) => Records.fromJson(e)).toList(), totalElements: res['totalPages'], totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, Records>> acceptDeliveryOrder(
    int id,
  ) async {
    try {
      final response = await _deliveryRemoteService.acceptDeliveryOrder(id);

      return right(
        await response.when(
          success: (res) => Records.fromJson(res!['record']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, Records>> denyDeliveryOrder(
    int id,
  ) async {
    try {
      final response = await _deliveryRemoteService.denyDeliveryOrder(id);

      return right(
        await response.when(
          success: (res) => Records.fromJson(res!['record']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, Records>> deliveryOrderFindByCode(
    String id,
  ) async {
    try {
      final response = await _deliveryRemoteService.deliveryOrderFindByCode(id);

      return right(
        await response.when(
          success: (res) => Records.fromJson(res!['record']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, Records>> updateDeliveryOrder(
    int id,
  ) async {
    try {
      final response = await _deliveryRemoteService.updateDeliveryOrder(id);

      return right(
        await response.when(
          success: (res) => Records.fromJson(res!['record']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, Records>> validateOtpToDeliveryOrder(OtpRequest request) async {
    try {
      final response = await _deliveryRemoteService.validateOtpToDeliveryOrder(request.id, request.value);

      return right(await response.when(
        success: (res) => Records.fromJson(res!['record']),
      ));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, Records>> sendOtpToDeliveryOrder(
    int id,
  ) async {
    try {
      final response = await _deliveryRemoteService.sendOtpToDeliveryOrder(id);

      return right(await response.when(
        success: (res) => Records.fromJson(res!['record']),
      ));
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }



}
