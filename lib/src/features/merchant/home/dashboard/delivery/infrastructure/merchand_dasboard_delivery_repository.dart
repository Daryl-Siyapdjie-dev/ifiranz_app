import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/transaction_info.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/delivery/infrastructure/merchand_dasboard_delivery_remote_service.dart';

import '../../../../../core/domain/paginated_response.dart';
import '../../../../../core/infrastructure/utils/api_exception.dart';

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
}
