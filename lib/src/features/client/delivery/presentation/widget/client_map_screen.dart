import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/contants.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/distance_utils.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/shared/providers.dart';

import '../../../../core/domain/enum.dart';
import '../../../../core/infrastructure/utils/bitmapDescriptorFromSvgAsset.dart';
import '../../../../core/infrastructure/utils/common_import.dart';
import '../../../../delivery/orders/domain/delivery_models.dart';
import '../../../../merchant/orders/shared/providers.dart';

@RoutePage()
class TestClientMapScreen extends ConsumerStatefulWidget {
  final Records record;
  final Function handleUpadteStatus;
  const TestClientMapScreen({required this.record, required this.handleUpadteStatus, super.key});

  @override
  ConsumerState createState() => _TestClientMapScreenState();
}

class _TestClientMapScreenState extends ConsumerState<TestClientMapScreen> {
  @override
  Widget build(BuildContext context) {
    final order = ref.watch(getOrderProvider(widget.record.commande!.id!));

    return widget.record.latitude is! double
        ? switch (order) {
            AsyncError(:final error) => IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => ref.refresh(getOrderProvider(widget.record.commande!.id!).future),
              ),
            AsyncData(:final value) => Column(
                children: [
                  if (value.latitude is! double)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [Text(context.locale.registerAdditionnalLocationNeighborhood), Text(widget.record.commande?.localisationGps ?? "")],
                      ),
                    ),
                  Expanded(
                    child: MapScreen(
                        handleUpadteStatus: widget.handleUpadteStatus,
                        userPosition: Position.fromMap({'latitude': value.latitude, 'longitude': value.longitude}),
                        merchantPosition: Position.fromMap({
                          'latitude': widget.record.commande!.articles!.first.article!.marchand!.latitude,
                          'longitude': widget.record.commande!.articles!.first.article!.marchand!.longitude
                        }),
                        commande: widget.record),
                  ),
                ],
              ),
            _ => const Center(child: CircularProgressIndicator()),
          }
        : MapScreen(
            userPosition: Position.fromMap({'latitude': widget.record.latitude, 'longitude': widget.record.longitude}),
            merchantPosition: Position.fromMap({
              'latitude': widget.record.commande!.articles!.first.article!.marchand!.latitude,
              'longitude': widget.record.commande!.articles!.first.article!.marchand!.longitude
            }),
            commande: widget.record);
  }
}

class MapScreen extends ConsumerStatefulWidget {
  final Position userPosition, merchantPosition;
  final Records commande;
  final Function? handleUpadteStatus;
  const MapScreen({super.key, required this.userPosition, this.handleUpadteStatus, required this.merchantPosition, required this.commande});

  @override
  ConsumerState createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconDeliver = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconMerchand = BitmapDescriptor.defaultMarker;

  final Completer<GoogleMapController> _controller = Completer();
  List<LatLng> polygonLatLngs = <LatLng>[];
  List<LatLng> polylineCoordinates = [];
  late OrderStatus status =
      OrderStatus.values.firstWhere((e) => e.value.toLowerCase() == widget.commande.statut!.toLowerCase(), orElse: () => OrderStatus.enCours);
  LatLng? currentLocation;
  LatLng? oldUpdatedPolilinesLocation;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      addCustomIcon();
      ref.read(firestoreServiceProvider).streamUserPositions(idCommande: widget.commande.id!).listen((event) {
        currentLocation = LatLng(event.latitude, event.longitude);

        if (oldUpdatedPolilinesLocation is! LatLng) {
          oldUpdatedPolilinesLocation = LatLng(event.latitude, event.longitude);
          getPolyPoints();
        } else {
          final distance =
              calculateDistance(event.latitude, event.longitude, oldUpdatedPolilinesLocation!.latitude, oldUpdatedPolilinesLocation!.longitude);

          if (distance.$2 == "m" && double.parse(distance.$1) >= 50) {
            getPolyPoints();
          } else if (distance.$2 == "km" && double.parse(distance.$1) >= 1) {
            getPolyPoints();
          }
        }

        if (event.status != 'nothing' && event.status != widget.commande.statut) {
          status = OrderStatus.values.firstWhere((e) => e.value.toLowerCase() == event.status.toLowerCase(), orElse: () => OrderStatus.enCours);
          widget.handleUpadteStatus!(status);
        }

        _goToUserLocation(event.latitude, event.longitude);

        if (mounted) {
          setState(() {});
        }
      });
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant MapScreen oldWidget) {
    if (mounted && oldWidget.commande.statut != widget.commande.statut) {
      setState(() {});
      getPolyPoints();
    }
    super.didUpdateWidget(oldWidget);
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        Constants.googleMapAPiKey, // Your Google Map Key
        PointLatLng(currentLocation!.latitude, currentLocation!.longitude),
        (widget.commande.statut == OrderStatus.enPreparation.value)
            ? PointLatLng(widget.merchantPosition.latitude, widget.merchantPosition.longitude)
            : PointLatLng(widget.userPosition.latitude, widget.userPosition.longitude));

    if (result.points.isNotEmpty) {
      polylineCoordinates = result.points.map((point) => LatLng(point.latitude, point.longitude)).toList();
      setState(() {});
    }
  }

  void addCustomIcon() {
    bitmapDescriptorFromSvgAsset('assets/icons/gis_position.svg').then((value) {
      setState(() {
        markerIcon = value;
      });
    });

    bitmapDescriptorFromSvgAsset('assets/icons/deliver_start.svg').then((value) {
      setState(() {
        markerIconDeliver = value;
      });
    });

    bitmapDescriptorFromSvgAsset('assets/icons/merchand.svg').then((value) {
      setState(() {
        markerIconMerchand = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      markers: {
        if (widget.commande.statut != OrderStatus.enPreparation.value)
          Marker(markerId: const MarkerId("client"), position: LatLng(widget.userPosition.latitude, widget.userPosition.longitude), icon: markerIcon),
        if (currentLocation is LatLng) Marker(markerId: const MarkerId("livreur"), position: currentLocation!, icon: markerIconDeliver),
        if (widget.commande.statut == OrderStatus.enPreparation.value)
          Marker(
              markerId: const MarkerId("merchant"),
              position: LatLng(widget.merchantPosition.latitude, widget.merchantPosition.longitude),
              icon: markerIconMerchand),
      },
      polylines: {
        Polyline(
          polylineId: const PolylineId("route"),
          points: polylineCoordinates,
          color: AppColors.primaryColor,
          width: 5,
        ),
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.userPosition.latitude, widget.userPosition.longitude),
        zoom: 16,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  Future<void> _goToUserLocation(double latitude, double longitude) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(latitude, longitude),
      tilt: 59.440717697143555,
      zoom: 16.5,
    )));
  }
}
