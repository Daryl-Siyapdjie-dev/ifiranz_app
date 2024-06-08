import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/url_builder.dart';

class MerchandDashboardDeliveryRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  MerchandDashboardDeliveryRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> merchantDeliveries({
    required PaginatedRequest params,
    required List<FilterOptional> request,
  }) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.builMerchantDeliveries(params),
          data: request.map((e) => e.toJson()).toList()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}
