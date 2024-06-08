import 'dart:math';

(String, String) calculateDistance(
    double lat1, double lon1, double lat2, double lon2) {
  const double earthRadius = 6371000;

  double dLat = (lat2 - lat1) * pi / 180;
  double dLon = (lon2 - lon1) * pi / 180;

  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1 * pi / 180) *
          cos(lat2 * pi / 180) *
          sin(dLon / 2) *
          sin(dLon / 2);

  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  double distanceInMeters = earthRadius * c;

  return formatDistance(distanceInMeters);
}

(String, String) formatDistance(double distanceInMeters) {
  if (distanceInMeters >= 1000) {
    double distanceInKilometers = distanceInMeters / 1000;
    return (distanceInKilometers.toStringAsFixed(2), 'km');
  } else {
    return (distanceInMeters.toStringAsFixed(2), 'm');
  }
}
