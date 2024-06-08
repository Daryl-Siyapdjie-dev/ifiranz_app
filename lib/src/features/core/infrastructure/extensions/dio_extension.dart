import 'dart:io';

import 'package:dio/dio.dart';

extension DioExtension on DioException {
  bool get noConnexionError =>
      type == DioExceptionType.unknown && error is SocketException;
}
