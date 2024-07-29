import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/commission_model.dart';

import '../../../../../client/home/domain/filter_optional.dart';
import '../../../../../core/domain/api_failure.dart';
import '../../../../../core/domain/paginated_request.dart';
import '../../../../../core/domain/paginated_response.dart';
import '../../../../../core/infrastructure/services/local/shared_pref.dart';
import '../../../../../core/infrastructure/utils/api_exception.dart';
import '../../../../../delivery/orders/domain/delivery_models.dart';
import 'merchand_dasboard_delivery_remote_service.dart';

class MerchandDashboardDeliveryRepository {
  final MerchandDashboardDeliveryRemoteService _productRemoteService;

  const MerchandDashboardDeliveryRepository(this._productRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<Records>>> merchantDeliveries(
      PaginatedRequest params) async {
    try {
      final response = await _productRemoteService.merchantDeliveries(
        params: params,
        request: [
          FilterOptional.fromJson({
            "value": SharedPref.getEmail(),
            "key": "code",
            "type": "EQUAL",
            "aliasKey": "commande.pourMarchand"
          })
        ],
      );

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

  // Fetch Merchant orders

  Future<Either<ApiFailure, PaginatedResponse<Records>>> getMerchandOrders(
      PaginatedRequest params) async {
    try {
      final response = await _productRemoteService.getMerchandOrders(
        params: params,
        request: [
          FilterOptional.fromJson({
            "key": "isParcel",
            "value": true,
            "applyAnd": true,
            "type": "EQUAL"
          })
        ],
      );

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

  Future<Either<ApiFailure, PaginatedResponse<Records>>> getMerchantDeliveries(
      PaginatedRequest params) async {
    try {
      final response = await _productRemoteService.getMerchantDeliveries(
        params: params,
        request: [
          FilterOptional.fromJson({
            "key": "pourMarchand",
            "value":
                "|${SharedPref.getId()}|", // It is important to keep the merchant ID in this format |PutTheIdInsideThere|
            "type": "EQUAL",
            "applyAnd": true
          }),
          FilterOptional.fromJson({
            "key": "codeLivraison",
            "value": "",
            "type": "NOT_NULL",
            "applyAnd": true
          })
        ],
      );

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

// Fetch Merchamt Commission

  Future<Either<ApiFailure, Commission>> getMerchantCommissions(
      PaginatedRequest params) async {
    try {
      final response =
          await _productRemoteService.getMerchantCommissions(params: params);

      return right(
        await response.when(
          success: (res) => Commission.fromJson(res!),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}
