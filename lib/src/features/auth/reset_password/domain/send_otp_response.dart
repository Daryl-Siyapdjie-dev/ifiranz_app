import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_response.freezed.dart';

@freezed
class SendOtpResponse with _$SendOtpResponse {
  factory SendOtpResponse({required String token, String? otp}) =
      _SendOtpResponse;

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) {
    final token = json['token'];

    if (token == null || token.isEmpty || token == "") {
      return SendOtpResponse(
        token: json['acces_token'],
        otp: json['otp'] as String?,
      );
    } else {
      return SendOtpResponse(
        token: token,
        otp: json['otp'],
      );
    }
  }
}
