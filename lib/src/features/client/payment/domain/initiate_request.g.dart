// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitiateRequestImpl _$$InitiateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$InitiateRequestImpl(
      command: json['command'] as int?,
      paymentMethod: json['paymentMethod'] as int?,
    );

Map<String, dynamic> _$$InitiateRequestImplToJson(
        _$InitiateRequestImpl instance) =>
    <String, dynamic>{
      'command': instance.command,
      'paymentMethod': instance.paymentMethod,
    };
