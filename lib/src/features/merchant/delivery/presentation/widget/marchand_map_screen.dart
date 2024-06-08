import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/contants.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/distance_utils.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/shared/providers.dart';

import '../../../../core/infrastructure/utils/bitmapDescriptorFromSvgAsset.dart';
import '../../../../core/infrastructure/utils/common_import.dart';
import '../../../../core/shared/providers.dart' '';
import '../../../../delivery/orders/domain/delivery_models.dart';

@RoutePage()
class MarchandClientMapScreen extends ConsumerStatefulWidget {
  final Records commande;
  const MarchandClientMapScreen({required this.commande, super.key});

  @override
  ConsumerState createState() => _MarchandClientMapScreenState();
}

class _MarchandClientMapScreenState
    extends ConsumerState<MarchandClientMapScreen> {
  @override
  void initState() {
    ref.read(geoLocatorServiceProvider).requestService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MapScreen(
        userPosition:
            Position.fromMap({'latitude': 3.871175, 'longitude': 11.453790}),
        commandeId: widget.commande.id!);
  }
}

class MapScreen extends ConsumerStatefulWidget {
  final Position userPosition;
  final int commandeId;
  const MapScreen(
      {super.key, required this.userPosition, required this.commandeId});

  @override
  ConsumerState createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconDeliver = BitmapDescriptor.defaultMarker;
  final Completer<GoogleMapController> _controller = Completer();
  List<LatLng> polygonLatLngs = <LatLng>[];
  List<LatLng> polylineCoordinates = [];

  LatLng? currentLocation;
  LatLng? oldUpdatedPolilinesLocation;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      addCustomIcon();
      ref
          .read(firestoreServiceProvider)
          .streamUserPositions(idCommande: widget.commandeId)
          .listen((event) {
        currentLocation = LatLng(event.latitude, event.longitude);

        if (oldUpdatedPolilinesLocation is! LatLng) {
          oldUpdatedPolilinesLocation = LatLng(event.latitude, event.longitude);
          getPolyPoints();
        } else {
          final distance = calculateDistance(
              event.latitude,
              event.longitude,
              oldUpdatedPolilinesLocation!.latitude,
              oldUpdatedPolilinesLocation!.longitude);

          if (distance.$2 == "m" && double.parse(distance.$1) >= 50) {
            getPolyPoints();
          } else if (distance.$2 == "km" && double.parse(distance.$1) >= 1) {
            getPolyPoints();
          }
        }

        _goToUserLocation(event.latitude, event.longitude);

        if (mounted) {
          setState(() {});
        }
      });
    });

    super.initState();
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Constants.googleMapAPiKey, // Your Google Map Key
        PointLatLng(currentLocation!.latitude, currentLocation!.longitude),
        PointLatLng(
            widget.userPosition.latitude, widget.userPosition.longitude));

    if (result.points.isNotEmpty) {
      polylineCoordinates = result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
      setState(() {});
    }
  }

  void addCustomIcon() {
    bitmapDescriptorFromSvgAsset('assets/icons/gis_position.svg').then((value) {
      setState(() {
        markerIcon = value;
      });
    });

    bitmapDescriptorFromSvgAsset('assets/icons/g388.svg').then((value) {
      setState(() {
        markerIconDeliver = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      markers: {
        Marker(
            markerId: const MarkerId("client"),
            position: LatLng(
                widget.userPosition.latitude, widget.userPosition.longitude),
            icon: markerIcon),
        if (currentLocation is LatLng)
          Marker(
              markerId: const MarkerId("livreur"),
              position: currentLocation!,
              icon: markerIconDeliver),
      },
      polylines: {
        Polyline(
          polylineId: const PolylineId("route"),
          points: polylineCoordinates,
          color: AppColors.primaryColor,
          width: 3,
        ),
      },
      initialCameraPosition: CameraPosition(
        target:
            LatLng(widget.userPosition.latitude, widget.userPosition.longitude),
        zoom: 16,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  Future<void> _goToUserLocation(double latitude, double longitude) async {
    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(latitude, longitude),
      tilt: 59.440717697143555,
      zoom: 16.5,
    )));
  }
}
