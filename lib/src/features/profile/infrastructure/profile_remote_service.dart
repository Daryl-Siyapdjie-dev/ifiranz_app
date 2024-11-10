
import 'package:dio/dio.dart';

import '../../core/domain/type_defs.dart';
import '../../core/infrastructure/utils/api_response.dart';
import '../../core/infrastructure/utils/handle_api_call.dart';
import '../../core/infrastructure/utils/url_builder.dart';

class ProfileRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;

  ProfileRemoteService(this._urlBuilder, this._dio);

  Future<ApiResponse<void>> deleteAccount(int userId) async {
    return handleApiCall<ApiResponse<void>>(
          () async => _dio.post(_urlBuilder.buildDeleteAccount(userId),),
          (data) {
        return ApiResponse.success(null);
      },
    );
  }
}