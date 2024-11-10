import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/auth/core/infrastructure/user_service.dart';
import 'package:ifiranz_client/src/features/core/domain/api_failure.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_exception.dart';

import '../../infrastructure/auth_service.dart';
import '../domain/client_request.dart';


class GetCurrentUserRepository {
  final GetCurrentUserRemoteService _remoteService;
  final AuthService _authService;

  GetCurrentUserRepository(this._remoteService, this._authService);

  Future<Either<ApiFailure, Client>> getCurrentClient() async {
    try {
      final response = await _remoteService.getCurentClient(ClientRequest());
      return response.when(
        success: (res) async {
          final user = Client.fromJson((res!['records'] as List).first);
          await _authService.setUserId(user.id!); // Stocke l'ID
          return right(user);
        },
      );
    } on ApiException catch (e) {
      return left(ApiFailure.failure(e.msg));
    }
  }

  Future<int?> getConnectedUserId() async {
    return await _authService.getUserId();
  }
}
