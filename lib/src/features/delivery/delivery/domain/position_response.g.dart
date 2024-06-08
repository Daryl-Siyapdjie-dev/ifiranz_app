// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionResponseImpl _$$PositionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PositionResponseImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$PositionResponseImplToJson(
        _$PositionResponseImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
    };
