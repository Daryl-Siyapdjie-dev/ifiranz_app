import 'package:dartz/dartz.dart';
import 'package:ifiranz_client/src/features/profile/infrastructure/profile_remote_service.dart';
import '../../core/domain/api_failure.dart';
import '../../core/domain/type_defs.dart';
import '../../core/infrastructure/utils/api_exception.dart';



class ProfileRepository {
  final ProfileRemoteService _profileRemoteService;

  ProfileRepository(this._profileRemoteService);

  Future<Either<ApiFailure, void>> deleteAccount(int params,) async {
    try {
      final response = await _profileRemoteService.deleteAccount(params);

      return right(
        await response.when(
            success: (res) => null),
      );
    } on ApiException catch (apiException) {
      return left(ApiFailure.failure(apiException.msg));
    }
  }
}