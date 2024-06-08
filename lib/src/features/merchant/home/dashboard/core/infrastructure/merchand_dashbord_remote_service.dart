import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/url_builder.dart';
import 'package:intl/intl.dart';

class MerchandDashboardRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  MerchandDashboardRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> merchantDashboardCountCommandeMerchand() async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.builMerchantDashboardCountCommandeMerchand(), data: {
        {"startDate": "2024-01-01", "endDate": DateFormat('yyyy-MM-dd').format(DateTime.now())}
      }),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> merchantDashboardCountArticlesMerchand() async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(
        _urlBuilder.builMerchantDashboardCountArticlesMerchand(),
      ),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> merchantDashboardCountLivraisonMerchand() async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.builMerchantDashboardCountLivraisonMerchand(), data: {
        {"startDate": "2024-01-01", "endDate": DateFormat('yyyy-MM-dd').format(DateTime.now()), "resquestParam": ""}
      }),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<int>> builMerchantDashboardCountTransactions(String name) async {
    return handleApiCall<ApiResponse<int>>(
      () async => _dio.get(
        _urlBuilder.builMerchantDashboardCountTransactions(name),
      ),
      (data) {
        return ApiResponse.success(data['record'] as int);
      },
    );
  }
}
