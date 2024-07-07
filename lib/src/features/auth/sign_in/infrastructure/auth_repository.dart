import 'package:dartz/dartz.dart';

import '../../../core/domain/api_failure.dart';
import '../../../core/infrastructure/utils/api_exception.dart';
import 'auth_remote_service.dart';

class AuthRepository {
  final AuthRemoteService _authRemoteService;

  AuthRepository(
    this._authRemoteService,
  );

  Future<Either<ApiFailure, String?>> loginUser(
    String emailOrPhone,
    String password,
  ) async {
    try {
      final response = await _authRemoteService.loginUser(
        emailOrPhone,
        password,
      );

      return right(
        await response.when(
          success: (_) => response.data,
        ),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}
