import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/core/infrastructure/merchand_dashbord_remote_service.dart';
import '../../../../../core/infrastructure/utils/api_exception.dart';

class MerchandDashboardRepository {
  final MerchandDashboardRemoteService _productRemoteService;

  MerchandDashboardRepository(this._productRemoteService);

  Future<int> merchantDashboardCountArticlesMerchand() async {
    try {
      final response =
          await _productRemoteService.merchantDashboardCountArticlesMerchand();

      return await response.when(
        success: (res) => res?['record']['countArticles'],
      );
    } on ApiException catch (apiException) {
      throw ApiFailure.failure(apiException.msg);
    }
  }

  Future<int> merchantDashboardCountLivraisonMerchand() async {
    try {
      final response =
          await _productRemoteService.merchantDashboardCountLivraisonMerchand();

      return await response.when(
          success: (res) => 0 //res?['record']['countCommand'],
          );
    } on ApiException catch (apiException) {
      throw ApiFailure.failure(apiException.msg);
    }
  }

  Future<int> merchantDashboardCountTransactions(String name) async {
    try {
      final response = await _productRemoteService
          .builMerchantDashboardCountTransactions(name);

      return await response.when(
        success: (res) {
          return res!;
        },
      );
    } on ApiException catch (apiException) {
      throw ApiFailure.failure(apiException.msg);
    }
  }
}
