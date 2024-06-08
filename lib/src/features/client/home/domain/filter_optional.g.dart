// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_optional.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterOptionalImpl _$$FilterOptionalImplFromJson(Map<String, dynamic> json) =>
    _$FilterOptionalImpl(
      aliasKey: json['aliasKey'] as String?,
      key: json['key'] as String?,
      value: json['value'],
      value1: json['value1'] as String?,
      type: json['type'] as String?,
      applyAnd: json['applyAnd'] as bool?,
    );

Map<String, dynamic> _$$FilterOptionalImplToJson(
        _$FilterOptionalImpl instance) =>
    <String, dynamic>{
      'aliasKey': instance.aliasKey,
      'key': instance.key,
      'value': instance.value,
      'value1': instance.value1,
      'type': instance.type,
      'applyAnd': instance.applyAnd,
    };
