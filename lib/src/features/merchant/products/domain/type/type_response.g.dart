// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypeResponseImpl _$$TypeResponseImplFromJson(Map<String, dynamic> json) =>
    _$TypeResponseImpl(
      id: json['id'] as int,
      version: json['version'] as int,
      code: json['code'] as String?,
      designation: json['designation'] as String,
    );

Map<String, dynamic> _$$TypeResponseImplToJson(_$TypeResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
    };
