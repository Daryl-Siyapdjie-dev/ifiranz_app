import 'dart:async';
import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ifiranz_client/src/features/client/delivery/application/location_picker_notifier/search_place_notifier.dart';
import 'package:ifiranz_client/src/features/client/delivery/infrastructure/external_services/geolocation_service.dart';
import 'package:ifiranz_client/src/features/client/delivery/infrastructure/remote_service/search_location_service.dart';
import 'package:ifiranz_client/src/features/client/delivery/presentation/widget/input_manual_location.dart';
import 'package:ifiranz_client/src/features/client/home/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';

import '../../../../core/infrastructure/utils/common_import.dart';
import '../../domain/search_location_models.dart';

@RoutePage()
class LocationPickerScreen extends StatefulHookConsumerWidget {
  const LocationPickerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LocationPickerWidgetState();
}

class _LocationPickerWidgetState extends ConsumerState<LocationPickerScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final _locationController = TextEditingController();
  final placesService = PlacesService();
  Position? _userPosition;
  bool _loading = false;

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.read(geoLocatorServiceProvider).requestService();
      ref.read(geoLocatorServiceProvider).positionStream.listen((event) {
        _goToUserLocation(
          event.latitude,
          event.longitude,
        );
        if (mounted) {
          setState(() {
            _userPosition = Position.fromMap({
              "latitude": event.latitude,
              "longitude": event.longitude,
            });
          });
        }
      }, onError: (error) {
        if (!mounted) return;
        if (error is LocationPermissionDenyException) {
          _showPermissionDeniedForeverPopup();

          if (error is LocationPermissionException) {
            _showPermissionDeniedPopup();
          }
        }
      });

      ref.read(geoLocatorServiceProvider).isLocationServiceEnabled();
    });
  }

  void _showPermissionDeniedPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Location Permission Denied'),
          content: const Text(
              'Please grant location permission to use this feature.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _inputManualLocation();
              },
              child: const Text('Input Manually'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _requestLocationPermission();
              },
              child: const Text('Grant Permission'),
            ),
          ],
        );
      },
    );
  }

  void _showPermissionDeniedForeverPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Location Permission Denied forever'),
          content: const Text(
              'Please grant location permission to use this feature.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _inputManualLocation();
              },
              child: const Text('Input Manually'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _openAppSettings();
              },
              child: const Text('Open App Settings'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _requestLocationPermission() async {
    await ref.read(geoLocatorServiceProvider).requestService();
  }

  Future<void> _inputManualLocation() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ManualLocationDialog(
            onLocationSubmitted: (lat, long) async {},
          );
        });
  }

  Future<void> _openAppSettings() async {
    await ref.read(geoLocatorServiceProvider).openAppSettings();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.5244, 3.3792),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              title: TextField(
                controller: _locationController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                    hintText: "Search by Place, City, Office, or Store"),
                onChanged: (value) async {
                  ref
                      .read(searchCubitProvider.notifier)
                      .searchPlace(value.trim());
                },
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _locationController.clear();
                      ref.read(searchCubitProvider.notifier).clearSearch();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            body: Stack(children: [
              GoogleMap(
                onTap: (lat) {
                  FocusScope.of(context).unfocus();
                },
                initialCameraPosition: _kGooglePlex,
                onLongPress: (latlg) {
                  log(latlg.toJson().toString());
                  setState(() {
                    _userPosition = Position.fromMap({
                      "latitude": latlg.latitude,
                      "longitude": latlg.longitude
                    });
                  });
                },
                myLocationEnabled: true,
                markers: <Marker>{
                  if (_userPosition is Position)
                    Marker(
                      draggable: true,
                      markerId: const MarkerId("map"),
                      position: LatLng(
                          _userPosition!.latitude, _userPosition!.longitude),
                      icon: BitmapDescriptor.defaultMarker,
                      onDragEnd: (newPosition) {
                        if (newPosition is! Map) return;
                        setState(() {
                          _userPosition =
                              Position.fromMap(newPosition.toJson());
                        });
                      },
                      infoWindow: const InfoWindow(
                        title: 'Move to update your location',
                      ),
                    )
                },
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);

                  // ref
                  //     .read(geoLocatorServiceProvider)
                  //     .getCurrentLocation()
                  //     .then((pos) {
                  //   if (pos is Position) {
                  //     _goToUserLocation(
                  //       pos.latitude,
                  //       pos.longitude,
                  //     );
                  //     if (mounted) {
                  //       setState(() {
                  //         _userPosition = Position.fromMap({
                  //           "latitude": pos.latitude,
                  //           "longitude": pos.longitude,
                  //         });
                  //       });
                  // }
                  // }
                  // });
                },
              ),
              if (_loading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: _userPosition?.latitude == null
                                  ? null
                                  : () {
                                      print(_locationController.text);
                                      ref
                                          .read(cartProvider.notifier)
                                          .updateCart(ref
                                              .read(cartProvider)
                                              .copyWith(
                                                latitude:
                                                    _userPosition?.latitude,
                                                longitude:
                                                    _userPosition?.longitude,
                                                localisationGps:
                                                    _locationController.text,
                                              ));

                                      Navigator.pop(context);
                                    },
                              child: Text(context.locale.save)),
                        )),
                    const Spacer()
                  ],
                ),
              ),
              ref.watch(searchCubitProvider).maybeWhen(
                  orElse: () => Container(),
                  success: (data) {
                    return Positioned(
                        top: 0,
                        child: Container(
                            color: AppColors.bgGreyD,
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: Scrollbar(
                                thumbVisibility: true,
                                child: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      ...data.map(
                                        (e) => ListTile(
                                          onTap: () async {
                                            try {
                                              FocusScope.of(context).unfocus();

                                              Place sLocation =
                                                  await placesService
                                                      .getPlace(e.placeId);

                                              await _goToUserLocation(
                                                      sLocation.geometry
                                                          .location.lat,
                                                      sLocation.geometry
                                                          .location.lng)
                                                  .whenComplete(() => ref
                                                      .read(searchCubitProvider
                                                          .notifier)
                                                      .clearSearch());

                                              _locationController.text =
                                                  sLocation.name;

                                              setState(() {
                                                _userPosition =
                                                    Position.fromMap({
                                                  "latitude": sLocation
                                                      .geometry.location.lat,
                                                  "longitude": sLocation
                                                      .geometry.location.lng
                                                });
                                              });
                                            } catch (_) {}
                                          },
                                          title: Text(e.description),
                                        ),
                                      )
                                    ])))));
                  }),
            ]));
      }),
    );
  }

  Future<void> _goToUserLocation(double latitude, double longitude) async {
    if (mounted) {
      setState(() {
        _loading = true;
      });
    }
    final GoogleMapController controller = await _controller.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(latitude, longitude),
      bearing: 192.8334901395799,
      tilt: 59.440717697143555,
      zoom: 16.5,
    )));

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }
}
