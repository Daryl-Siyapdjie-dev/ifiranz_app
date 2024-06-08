// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_location_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceSearchImpl _$$PlaceSearchImplFromJson(Map<String, dynamic> json) =>
    _$PlaceSearchImpl(
      description: json['description'] as String,
      placeId: json['placeId'] as String,
    );

Map<String, dynamic> _$$PlaceSearchImplToJson(_$PlaceSearchImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'placeId': instance.placeId,
    };

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      name: json['name'] as String,
      vicinity: json['vicinity'] as String,
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'geometry': instance.geometry,
      'name': instance.name,
      'vicinity': instance.vicinity,
    };

_$GeometryImpl _$$GeometryImplFromJson(Map<String, dynamic> json) =>
    _$GeometryImpl(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeometryImplToJson(_$GeometryImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
