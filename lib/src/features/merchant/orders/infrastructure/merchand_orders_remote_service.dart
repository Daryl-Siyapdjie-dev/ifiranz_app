import 'package:dio/dio.dart';

import '../../../client/home/domain/filter_optional.dart';
import '../../../core/domain/paginated_request.dart';
import '../../../core/domain/type_defs.dart';
import '../../../core/infrastructure/utils/api_response.dart';
import '../../../core/infrastructure/utils/handle_api_call.dart';
import '../../../core/infrastructure/utils/url_builder.dart';

class MerchandOrdersRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  MerchandOrdersRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getAllOrders(
      PaginatedRequest params, List<FilterOptional> request) async {
    print(request);
    return handleApiCall<ApiResponse<Json>>(
      // () async => _dio.post(_urlBuilder.buildClientOrders(params),
      //     data: request.map((e) => e.toJson()).toList()),

// ? I have change the url path for this request
      () async => _dio.post(_urlBuilder.builV2MerchantCommands(params),
          data: request.map((e) => e.toJson()).toList()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getOrder(id) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(
        _urlBuilder.builGetCommand(id),
      ),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getOrdersState(
      PaginatedRequest params, List<FilterOptional> request) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.builMerchantDailyCommandState(params),
          data: request.map((e) => e.toJson()).toList()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}
