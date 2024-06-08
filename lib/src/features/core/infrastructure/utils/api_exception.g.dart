// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiExceptionImpl _$$ApiExceptionImplFromJson(Map<String, dynamic> json) =>
    _$ApiExceptionImpl(
      code: json['statusCode'] as int?,
      msg: json['message'] as String?,
      timeStamp: json['timeStamp'] as String?,
      httpStatus: json['httpStatus'] as String?,
    );

Map<String, dynamic> _$$ApiExceptionImplToJson(_$ApiExceptionImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.code,
      'message': instance.msg,
      'timeStamp': instance.timeStamp,
      'httpStatus': instance.httpStatus,
    };
