import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/dio_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_constants.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_exception.dart';

Future<T> handleApiCall<T>(
    Future<Response<dynamic>> Function() apiCall,
    T Function(Map val) successMapper, {
      String? displayErrorMessage,
    }) async {
  try {
    log('Starting API call...');

    // Exécutez l'appel API
    final response = await apiCall();
    log('API call completed. Response status: ${response.statusCode}');
    log('Response data: ${response.data}');

    // Vérifiez si les données sont un entier
    if (response.data is int) {
      log('Response data is an integer. Mapping success...');
      return successMapper({"data": response.data});
    }

    // Vérifiez si les données sont une Map et valides
    if (response.data is Map &&
        (response.data?["valid"] == true ||
            ((response.data?["statusCode"] ?? 0) >= 200 &&
                (response.data?["statusCode"] ?? 0) <= 303))) {
      log('Response data is valid. Mapping success...');
      return successMapper(response.data);
    } else {
      log('Response data is not valid. Handling errors...');
      if (response.data is Map) {
        if ((response.data?["valid"] ?? false) == false) {
          final message = response.data?["message"]?.toString() ?? "An error occurred";
          log('Invalid response. Message: $message');
          throw ApiException(msg: message);
        }
        log('Throwing ApiException from JSON response.');
        throw ApiException.fromJson(response.data);
      } else {
        final fallbackMessage = displayErrorMessage ?? "An error occurred";
        log('Response data is not a Map. Throwing ApiException. Message: $fallbackMessage');
        throw ApiException(msg: fallbackMessage);
      }
    }
  } on DioException catch (e) {
    log('DioException caught: ${e.toString()}');

    // Gérer les erreurs de connexion
    if (e.noConnexionError) {
      log('No connection error. Throwing ApiException with internetError message.');
      throw const ApiException(msg: ApiConstants.internetError);
    }

    // Gérer les erreurs avec réponse
    if (e.response != null) {
      log('Error response: ${e.response?.data}');
      throw ApiException(msg: e.message);
    }

    // Gérer les erreurs sans réponse et avec un message d'erreur affichable
    if (e.response == null && displayErrorMessage != null) {
      log('No response and displayErrorMessage provided: $displayErrorMessage');
      throw ApiException(msg: displayErrorMessage);
    }

    // Réémettre l'exception si elle n'est pas gérable
    log('Re-throwing unhandled DioException.');
    rethrow;
  } catch (e, stacktrace) {
    // Attrapez toute autre erreur
    log('Unexpected error: $e');
    log('Stacktrace: $stacktrace');
    rethrow;
  }
}
