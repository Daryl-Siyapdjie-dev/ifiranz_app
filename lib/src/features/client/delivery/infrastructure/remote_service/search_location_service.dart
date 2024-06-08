import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/delivery/domain/search_location_models.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/contants.dart';

final placesServiceProvider = Provider<PlacesService>((ref) {
  return PlacesService();
});

class PlacesService {
  final key = Constants.googleMapAPiKey;

  final Dio _dio = Dio();
  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&components=country:CM&key=$key';
    var response = await _dio.get(url);
    var json = response.data;
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    var response = await _dio.get(url);
    var json = response.data;
    var jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }

  Future<List<Place>> getPlaces(
      double lat, double lng, String placeType) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?location=$lat,$lng&type=$placeType&rankby=distance&key=$key';
    var response = await _dio.get(url);
    var json = response.data;
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
