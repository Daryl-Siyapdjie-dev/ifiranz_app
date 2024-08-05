import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_response.freezed.dart';
part 'send_otp_response.g.dart';

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

@freezed
class ForgotPasswordResponse with _$ForgotPasswordResponse {
  const ForgotPasswordResponse._();
  const factory ForgotPasswordResponse({
    String? timeStamp,
    int? statusCode,
    String? httpStatus,
    String? message,
    required Datas datas,
  }) = _ForgotPasswordResponse;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
}

@freezed
class Datas with _$Datas {
  const Datas._();
  const factory Datas({
    bool? valid,
  }) = _Datas;

  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);
}
