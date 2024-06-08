import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/domain/inventory.dart';

import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/infrastructure/merchand_inventory_remote_service.dart';

import '../../../../../core/domain/paginated_response.dart';
import '../../../../../core/infrastructure/utils/api_exception.dart';

class MerchandInventoryRepository {
  final MerchandInventoryRemoteService _productRemoteService;

  MerchandInventoryRepository(this._productRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<Inventory>>> getInventory(
      PaginatedRequest params,
      [List<FilterOptional> request = const []]) async {
    try {
      final response = await _productRemoteService.getInventory(params, [
        ...request,
        FilterOptional.fromJson({
          "key": "marchand",
          "value": SharedPref.getEmail(),
          "type": "EQUAL",
          "applyAnd": true
        }),
      ]);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<Inventory>(
              data: (res!['records'] as List)
                  .map((e) => Inventory.fromJson(e))
                  .toList(),
              totalElements: res['totalPages'],
              totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}
