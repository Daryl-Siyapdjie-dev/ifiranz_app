import 'dart:async';

import 'package:geolocator/geolocator.dart';

class GeoLocatorService {
  late GeolocatorPlatform _geolocator;
  late LocationPermission _permissionStatus;

  final StreamController<Position> _positionController =
      StreamController<Position>.broadcast();
  final StreamController<Position> _positionAccurateStreamController =
      StreamController<Position>.broadcast();

  void startListeningPosition() {
    Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
                distanceFilter: 10, accuracy: LocationAccuracy.best))
        .listen((event) {
      _positionAccurateStreamController.add(event);
    });
  }

  Stream<Position> get positionStream => _positionController.stream;
  Stream<Position> get positionAccurateStream =>
      _positionAccurateStreamController.stream;

  Future<LocationPermission> get permissionStatus async =>
      (await _geolocator.checkPermission());

  Stream<ServiceStatus> get positionAuthorization =>
      _geolocator.getServiceStatusStream();

  GeoLocatorService() {
    _geolocator = GeolocatorPlatform.instance;
  }

  Future<void> _requestPermission() async {
    _permissionStatus = await _geolocator.requestPermission();

    if (_permissionStatus == LocationPermission.whileInUse ||
        _permissionStatus == LocationPermission.always) {
      addCurrentLocation();
    } else if (_permissionStatus == LocationPermission.deniedForever) {
      _positionController.addError(LocationPermissionDenyException());
    } else {
      _positionController.addError(LocationPermissionException());
    }
  }

  Future<bool> isLocationServiceEnabled() async {
    return await _geolocator.isLocationServiceEnabled();
  }

  Future<void> requestService() async {
    await _requestPermission();
  }

  Future<void> openAppSettings() async {
    await _geolocator.openLocationSettings();
  }

  Future<Position?> getLasKnowingPosition() async {
    Position? position = await _geolocator.getLastKnownPosition();
    return position;
  }

  Future<void> addCurrentLocation() async {
    if (_permissionStatus == LocationPermission.always ||
        _permissionStatus == LocationPermission.whileInUse) {
      final position = await _geolocator.getCurrentPosition();
      _positionController.add(position);
    }
  }

  Future<Position?> getCurrentLocation() async {
    _permissionStatus = await _geolocator.requestPermission();

    if (_permissionStatus == LocationPermission.always ||
        _permissionStatus == LocationPermission.whileInUse) {
      final position = await _geolocator.getCurrentPosition();
      return position;
    }
    return null;
  }

  Future<void> dispose() async {
    _positionAccurateStreamController.close();
    await _positionController.close();
  }
}

class LocationPermissionException implements Exception {
  final String message = 'Location permission not granted.';
}

class LocationPermissionDenyException implements Exception {
  final String message = 'Location permission deny forever.';
}

class LocationServiceDisabledException implements Exception {
  final String message = 'Location service is disabled.';
}
