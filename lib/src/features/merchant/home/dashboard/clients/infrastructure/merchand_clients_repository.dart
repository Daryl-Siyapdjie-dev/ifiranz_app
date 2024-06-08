import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/clients/infrastructure/merchand_clients_remote_service.dart';

import '../../../../../core/domain/paginated_response.dart';
import '../../../../../core/infrastructure/utils/api_exception.dart';

class MerchandClientsRepository {
  final MerchandClientsRemoteService _productRemoteService;

  MerchandClientsRepository(this._productRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<Client>>> getListProducts(
    PaginatedRequest params,
  ) async {
    try {
      final response = await _productRemoteService.getClients(params, [
        FilterOptional.fromJson({"key": "userCreate", "value": SharedPref.getEmail(), "type": "EQUAL", "applyAnd": true})
      ]);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<Client>(
              data: (res!['records'] as List).map((e) => Client.fromJson(e)).toList(),
              totalElements: res['totalPages'],
              totalPages: res['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }

  Future<List<Client>> getSearchPatternClients(
    String pattern,
  ) async {
    final response = await _productRemoteService.getClients(PaginatedRequest(size: 20), [
      FilterOptional.fromJson({"key": "userCreate", "value": SharedPref.getEmail(), "type": "EQUAL", "applyAnd": true}),
      FilterOptional(value: pattern, type: "LIKE", key: "designation")
    ]);

    return await response.when(success: (res) => (res!['records'] as List).map((e) => Client.fromJson(e)).toList());
  }
}
