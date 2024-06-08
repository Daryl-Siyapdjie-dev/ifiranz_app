import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserLocalCredentialsRepository {
  static const _accesToken = 'access_token';

  UserLocalCredentialsRepository(this._storage);

  final FlutterSecureStorage _storage;

  Future<void> updateUserLocalCredentials({required accesToken}) =>
      Future.wait([_storage.write(key: _accesToken, value: accesToken)]);

  Future<String?> get getUserLocalCredentials async =>
      await _storage.read(key: _accesToken);

  Future<void> deleteUserLocalCredentials() => Future.wait([
        _storage.delete(key: _accesToken),
      ]);
}
