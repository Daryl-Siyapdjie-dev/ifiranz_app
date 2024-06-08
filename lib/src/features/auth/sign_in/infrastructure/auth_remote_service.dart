import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/user_local_credentials_repository.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/handle_api_call.dart';
import '../../../core/infrastructure/utils/api_response.dart';
import '../../../core/infrastructure/utils/url_builder.dart';

class AuthRemoteService {
  final UrlBuilder _urlBuilder;
  final Dio _dio;
  final UserLocalCredentialsRepository _userLocalCredentialsRepository;

  AuthRemoteService(
      this._urlBuilder, this._dio, this._userLocalCredentialsRepository);

  Future<ApiResponse<String?>> loginUser(
      String emailOrPhone, String password) async {
    return handleApiCall<ApiResponse<String?>>(
      () => _dio.post(
        _urlBuilder.buildLoginUser(),
        data: {
          "emailOrPhone": emailOrPhone,
          "password": password,
        },
      ),
      (data) {
        _userLocalCredentialsRepository.updateUserLocalCredentials(
            accesToken: data["datas"]["token"]);
        return ApiResponse.success(data["datas"]["token"]);
      },
    );
  }

  // Future<RemoteResponse<void>> logoutUser() async {
  //   try {
  //     final response = await _dio.post(_urlBuilder.buildLogoutUser());
  //     if (response.statusCode == 200) {
  //       return const RemoteResponse.success(null);
  //     } else {
  //       throw ApiException(msg: response.statusMessage);
  //     }
  //   } on DioException catch (e) {
  //     if (e.noConnexionError) {
  //       throw const ApiException(msg: 'Please check your internet connexion');
  //     } else if (e.response != null) {
  //       throw ApiException(msg: e.message);
  //     } else {
  //       rethrow;
  //     }
  //   }
  // }

  // Future<RemoteResponse<Unit>> refreshToken(String token) async {
  //   try {
  //     final response = await _dio.post(_urlBuilder.buildRefreshToken(token));
  //     if (response.statusCode == 200) {
  //       return const RemoteResponse.success(null);
  //     } else {
  //       throw ApiException(msg: response.statusMessage);
  //     }
  //   } on DioException catch (e) {
  //     if (e.noConnexionError) {
  //       throw const ApiException(msg: 'Please check your internet connexion');
  //     } else if (e.response != null) {
  //       throw ApiException(msg: e.message);
  //     } else {
  //       rethrow;
  //     }
  //   }
  // }
}
