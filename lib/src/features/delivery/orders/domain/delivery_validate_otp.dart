import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_validate_otp.freezed.dart';
part 'delivery_validate_otp.g.dart';

@freezed
class DeliveryValidateOtp with _$DeliveryValidateOtp {
  factory DeliveryValidateOtp({required int id, required int code}) =
      _DeliveryValidateOtp;

  factory DeliveryValidateOtp.fromJson(Map<String, dynamic> json) =>
      _$DeliveryValidateOtpFromJson(json);
}
