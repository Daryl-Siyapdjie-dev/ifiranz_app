import 'package:dio/dio.dart';

class DeleteAccountService {
  final Dio dio;

  DeleteAccountService(this.dio);

  Future<void> deleteAccount(int userId) async {
    final url = 'http://185.193.17.106:8085/auth-service/api/v1/auth/deleteAccount/$userId';

    try {
      final response = await dio.delete(url);

      if (response.statusCode == 200) {
        // Suppression réussie
      } else {
        throw Exception('Erreur lors de la suppression du compte');
      }
    } catch (e) {
      rethrow;
    }
  }
}
