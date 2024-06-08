import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/transaction_info.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/transactions/infrastructure/merchand_dasboard_transactions_remote_service.dart';

import '../../../../../core/domain/paginated_response.dart';
import '../../../../../core/infrastructure/utils/api_exception.dart';
import '../domain/transaction_response.dart';

class MerchandDashboardTransactionsRepository {
  final MerchandDashboardTransactionsRemoteService _productRemoteService;

  const MerchandDashboardTransactionsRepository(this._productRemoteService);

  Future<Either<ApiFailure, PaginatedResponse<TransactionResponse>>> getDeals(
      PaginatedRequest params, String marchandName) async {
    try {
      final response = await _productRemoteService.getDeals(
          params: params, marchandName: marchandName);

      return right(
        await response.when(
          success: (res) => PaginatedResponse<TransactionResponse>(
              data: (res!['datas']['page']['content'] as List)
                  .map((e) => TransactionResponse.fromJson(e))
                  .toList(),
              totalElements: res['datas']['page']['totalPages'],
              totalPages: res['datas']['page']['totalElements']),
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}
