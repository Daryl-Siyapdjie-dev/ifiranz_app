import 'package:dartz/dartz.dart';

import '../../../../core/domain/api_failure.dart';
import '../../../../core/domain/paginated_request.dart';
import '../../../../core/domain/paginated_response.dart';
import '../../../../core/infrastructure/utils/api_exception.dart';
import '../../../../delivery/orders/domain/delivery_models.dart';
import '../../../home/domain/filter_optional.dart';
import 'delivery_orders_remote_service.dart';

class DeliveryOrdersRepository {
  final DeliveryOrdersRemoteService _deliveryRemoteService;

  DeliveryOrdersRepository(this._deliveryRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<Records>>> getListDeliveryOrders(
      PaginatedRequest params) async {
    try {
      final response =
          await _deliveryRemoteService.getCurrentDeliveries(params);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<Records>(
              data: (res!['records'] as List)
                  .map((e) => Records.fromJson(e))
                  .toList(),
              totalElements: res['totalPages'],
              totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<Either<ApiFailure, PaginatedResponse<Records>>> getAllUserDeliveries(
      PaginatedRequest params, List<FilterOptional> filterOptions) async {
    try {
      final response = await _deliveryRemoteService.getAllUserDeliveries(
          params, filterOptions);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<Records>(
            data: (res!['records'] as List)
                .map((e) => Records.fromJson(e))
                .toList(),
            totalElements: res['totalPages'],
            totalPages: res['totalElements'],
          ),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}
