import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/url_builder.dart';

class MerchandDashboardTransactionsRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  MerchandDashboardTransactionsRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getDeals(
      {required PaginatedRequest params, required String marchandName}) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(
        _urlBuilder.builMerchantGetDeals(params, marchandName),
      ),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}
