// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infrastructur_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InfrastructurModelImpl _$$InfrastructurModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InfrastructurModelImpl(
      id: json['id'] as int,
      version: json['version'] as int,
      code: json['code'] as String,
      designation: json['designation'] as String,
      merchantId: json['merchantId'] as int?,
      adresse: json['adresse'] as String?,
      telephone1: json['telephone1'] as String,
      telephone2: json['telephone2'] as String?,
      arcticles: json['arcticles'] as List<dynamic>?,
      clients: json['clients'] as List<dynamic>?,
      user: json['user'] as String,
      url: json['url'] as String,
      type: json['type'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      indice: (json['indice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$InfrastructurModelImplToJson(
        _$InfrastructurModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'merchantId': instance.merchantId,
      'adresse': instance.adresse,
      'telephone1': instance.telephone1,
      'telephone2': instance.telephone2,
      'arcticles': instance.arcticles,
      'clients': instance.clients,
      'user': instance.user,
      'url': instance.url,
      'type': instance.type,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'indice': instance.indice,
    };
