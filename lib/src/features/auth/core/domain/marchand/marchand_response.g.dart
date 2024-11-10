// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marchand_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarchandResponseImpl _$$MarchandResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MarchandResponseImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      merchantId: json['merchantId'] as int?,
      adresse: json['adresse'] as String?,
      telephone1: json['telephone1'] as String?,
      telephone2: json['telephone2'] as String?,
      articles: json['articles'] as List<dynamic>?,
      clients: json['clients'] as List<dynamic>?,
      user: json['user'] as String?,
      photoEncoded: json['photoEncoded'] as String?,
      format: json['format'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$MarchandResponseImplToJson(
        _$MarchandResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'merchantId': instance.merchantId,
      'adresse': instance.adresse,
      'telephone1': instance.telephone1,
      'telephone2': instance.telephone2,
      'articles': instance.articles,
      'clients': instance.clients,
      'user': instance.user,
      'photoEncoded': instance.photoEncoded,
      'format': instance.format,
      'type': instance.type,
    };
