// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgotPasswordResponseImpl _$$ForgotPasswordResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ForgotPasswordResponseImpl(
      timeStamp: json['timeStamp'] as String?,
      statusCode: json['statusCode'] as int?,
      httpStatus: json['httpStatus'] as String?,
      message: json['message'] as String?,
      datas: Datas.fromJson(json['datas'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ForgotPasswordResponseImplToJson(
        _$ForgotPasswordResponseImpl instance) =>
    <String, dynamic>{
      'timeStamp': instance.timeStamp,
      'statusCode': instance.statusCode,
      'httpStatus': instance.httpStatus,
      'message': instance.message,
      'datas': instance.datas,
    };

_$DatasImpl _$$DatasImplFromJson(Map<String, dynamic> json) => _$DatasImpl(
      valid: json['valid'] as bool?,
    );

Map<String, dynamic> _$$DatasImplToJson(_$DatasImpl instance) =>
    <String, dynamic>{
      'valid': instance.valid,
    };
