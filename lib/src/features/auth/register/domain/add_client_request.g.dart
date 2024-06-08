// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_client_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddClientRequestImpl _$$AddClientRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AddClientRequestImpl(
      designation: json['designation'] as String? ?? "costumer",
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      phoneNumber: json['phoneNumber'] as String,
      adresse: json['adresse'] as String,
      localisationGps: json['localisationGps'] as String,
      user: json['user'] as String,
    );

Map<String, dynamic> _$$AddClientRequestImplToJson(
        _$AddClientRequestImpl instance) =>
    <String, dynamic>{
      'designation': instance.designation,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'phoneNumber': instance.phoneNumber,
      'adresse': instance.adresse,
      'localisationGps': instance.localisationGps,
      'user': instance.user,
    };
