// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_colis_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddColisRequestImpl _$$AddColisRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AddColisRequestImpl(
      designation: json['designation'] as String,
      clientName: json['clientName'] as String,
      clientPhone: json['clientPhone'] as String,
      quartier: Quartier.fromJson(json['quartier'] as Map<String, dynamic>),
      modePayement: json['modePayement'] as String,
      localisationGps: json['localisationGps'] as String?,
      description: json['description'] as String,
      isParcel: json['isParcel'] as bool? ?? true,
      dueAmount: (json['dueAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$AddColisRequestImplToJson(
        _$AddColisRequestImpl instance) =>
    <String, dynamic>{
      'designation': instance.designation,
      'clientName': instance.clientName,
      'clientPhone': instance.clientPhone,
      'quartier': instance.quartier,
      'modePayement': instance.modePayement,
      'localisationGps': instance.localisationGps,
      'description': instance.description,
      'isParcel': instance.isParcel,
      'dueAmount': instance.dueAmount,
    };
