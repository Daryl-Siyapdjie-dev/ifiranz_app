import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';

class AuthService {
  Future<int?> getUserId() async {
    return SharedPref.getId();
  }

  Future<void> setUserId(int id) async {
    await SharedPref.setId(id);
  }
}