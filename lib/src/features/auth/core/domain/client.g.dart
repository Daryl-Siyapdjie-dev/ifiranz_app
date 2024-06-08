// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      nom: json['nom'] as String?,
      prenom: json['prenom'] as String?,
      adresse: json['adresse'] as String?,
      tel: json['tel'] as String?,
      localisationGps: json['localisationGps'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'adresse': instance.adresse,
      'tel': instance.tel,
      'localisationGps': instance.localisationGps,
      'user': instance.user,
    };
