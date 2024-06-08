import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:dio/dio.dart';

class LocationService {
  final String key = 'AIzaSyCyKT55CP9L7AgtLagJMAd_NV_Pbu_d8OQ';
  final Dio _dio = Dio();

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';

    try {
      var response = await _dio.get(url);
      var placeId = response.data['candidates'][0]['place_id'] as String;

      return placeId;
    } catch (error) {
      print('Error getting place ID: $error');
      throw error;
    }
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    try {
      final placeId = await getPlaceId(input);

      final String url =
          'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

      var response = await _dio.get(url);
      var results = response.data['result'] as Map<String, dynamic>;

      print(results);
      return results;
    } catch (error) {
      print('Error getting place details: $error');
      throw error;
    }
  }

  Future<Map<String, dynamic>> getDirections(
      String origin, String destination) async {
    try {
      final String url =
          'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$key';

      var response = await _dio.get(url);
      var json = response.data;

      var results = {
        'bounds_ne': json['routes'][0]['bounds']['northeast'],
        'bounds_sw': json['routes'][0]['bounds']['southwest'],
        'start_location': json['routes'][0]['legs'][0]['start_location'],
        'end_location': json['routes'][0]['legs'][0]['end_location'],
        'polyline': json['routes'][0]['overview_polyline']['points'],
        'polyline_decoded': PolylinePoints()
            .decodePolyline(json['routes'][0]['overview_polyline']['points']),
      };

      print(results);

      return results;
    } catch (error) {
      print('Error getting directions: $error');
      throw error;
    }
  }
}
