// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quartier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuartierImpl _$$QuartierImplFromJson(Map<String, dynamic> json) =>
    _$QuartierImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      arrondissement: json['arrondissement'] == null
          ? null
          : QuartierArrondissement.fromJson(
              json['arrondissement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuartierImplToJson(_$QuartierImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'arrondissement': instance.arrondissement?.toJson(),
    };

_$QuartierArrondissementImpl _$$QuartierArrondissementImplFromJson(
        Map<String, dynamic> json) =>
    _$QuartierArrondissementImpl(
      id: json['id'] as int?,
      version: json['version'] as int?,
      code: json['code'] as String?,
      designation: json['designation'] as String?,
      montant: (json['montant'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$QuartierArrondissementImplToJson(
        _$QuartierArrondissementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'code': instance.code,
      'designation': instance.designation,
      'montant': instance.montant,
    };
