// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientRequestImpl _$$ClientRequestImplFromJson(Map<String, dynamic> json) =>
    _$ClientRequestImpl(
      key: json['key'] as String? ?? "user",
      value: json['value'] as String?,
      type: json['type'] as String? ?? "EQUAL",
    );

Map<String, dynamic> _$$ClientRequestImplToJson(_$ClientRequestImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'type': instance.type,
    };
