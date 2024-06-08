import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_location_models.freezed.dart';
part 'search_location_models.g.dart';

@freezed
class PlaceSearch with _$PlaceSearch {
  const factory PlaceSearch({
    required String description,
    required String placeId,
  }) = _PlaceSearch;

  factory PlaceSearch.fromJson(Map<String, dynamic> json) => PlaceSearch(
        description: json['description'],
        placeId: json['place_id'],
      );
}

@freezed
class Place with _$Place {
  const factory Place({
    required Geometry geometry,
    required String name,
    required String vicinity,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        geometry: Geometry.fromJson(json['geometry']),
        name: json['formatted_address'],
        vicinity: json['vicinity'],
      );
}

@freezed
class Geometry with _$Geometry {
  const factory Geometry({
    required Location location,
  }) = _Geometry;

  factory Geometry.fromJson(Map<dynamic, dynamic> parsedJson) => Geometry(
        location: Location.fromJson(parsedJson['location']),
      );
}

@freezed
class Location with _$Location {
  const factory Location({
    required double lat,
    required double lng,
  }) = _Location;

  factory Location.fromJson(Map<dynamic, dynamic> parsedJson) => Location(
        lat: parsedJson['lat'],
        lng: parsedJson['lng'],
      );
}
