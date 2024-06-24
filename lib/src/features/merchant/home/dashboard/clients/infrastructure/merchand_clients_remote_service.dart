import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/type_defs.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/url_builder.dart';

import '../../../../../core/infrastructure/services/local/shared_pref.dart';

class MerchandClientsRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  MerchandClientsRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<Json>> getClients(
      PaginatedRequest params, List<FilterOptional> request) async {
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.post(_urlBuilder.builSearchMerchantClient(params),
          data: request.map((e) => e.toJson()).toList()),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }

  Future<ApiResponse<Json>> getMerchantClients(PaginatedRequest params) async {
    print(SharedPref.getId());
    return handleApiCall<ApiResponse<Json>>(
      () async => _dio.get(_urlBuilder.builMerchantClientList(params), data: {
        "id": SharedPref.getId(), // id du marchand
      }),
      (data) {
        return ApiResponse.success(data as Json);
      },
    );
  }
}
