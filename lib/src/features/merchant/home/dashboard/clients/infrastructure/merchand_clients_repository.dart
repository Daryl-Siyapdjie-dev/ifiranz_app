import 'package:dartz/dartz.dart';

import '../../../../../auth/core/domain/client.dart';
import '../../../../../client/home/domain/filter_optional.dart';
import '../../../../../core/domain/api_failure.dart';
import '../../../../../core/domain/paginated_request.dart';
import '../../../../../core/domain/paginated_response.dart';
import '../../../../../core/infrastructure/services/local/shared_pref.dart';
import '../../../../../core/infrastructure/utils/api_exception.dart';
import 'merchand_clients_remote_service.dart';

class MerchandClientsRepository {
  final MerchandClientsRemoteService _productRemoteService;

  MerchandClientsRepository(this._productRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<Client>>> getListMerchantClients(
    PaginatedRequest params,
  ) async {
    try {
      final response = await _productRemoteService.getMerchantClients(params);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<Client>(
            data: (res!['record']['data']['content'] as List)
                .map((e) => Client.fromJson(e))
                .toList(),
            totalElements: res['record']['data']['totalPages'],
            totalPages: res['record']['data']['totalElements'],
          ),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<List<Client>> getSearchPatternClients(
    String pattern,
  ) async {
    final response =
        await _productRemoteService.getClients(PaginatedRequest(size: 20), [
      FilterOptional.fromJson({
        "key": "userCreate",
        "value": SharedPref.getEmail(),
        "type": "EQUAL",
        "applyAnd": true
      }),
      FilterOptional(value: pattern, type: "LIKE", key: "designation")
    ]);

    return await response.when(
        success: (res) =>
            (res!['records'] as List).map((e) => Client.fromJson(e)).toList());
  }
}
