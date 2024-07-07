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
      name: json['name'] as String?,
      nom: json['nom'] as String?,
      prenom: json['prenom'] as String?,
      adresse: json['adresse'] as String?,
      tel: json['tel'] as String?,
      localisationGps: json['localisationGps'] as String?,
      user: json['user'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'name': instance.name,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'adresse': instance.adresse,
      'tel': instance.tel,
      'localisationGps': instance.localisationGps,
      'user': instance.user,
      'email': instance.email,
      'phone': instance.phone,
    };
