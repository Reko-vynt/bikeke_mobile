import 'dart:async';

import 'package:bikeke_app/helpers/app_constants.dart';
import 'package:bikeke_app/helpers/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final Completer<MapboxMapController> _controller = Completer();
  static LocationData? currentLocation;
  final mapController = MapController();
  void getLocation() async {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      mapController.move(AppConstants().getLoc(currentLocation!), 18.0);
      setState(() {});
    });
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // MapboxMap(
          //     minMaxZoomPreference: const MinMaxZoomPreference(14, 37),
          //     myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
          //     zoomGesturesEnabled: true,
          //     onMapCreated: (mapController) {
          //       _controller.complete(mapController);
          //     },
          //     initialCameraPosition: CameraPosition(
          //         target: LatLng(
          //             _currentLocation.latitude, _currentLocation.longitude),
          //         zoom: 13),
          //     accessToken:
          //         'sk.eyJ1IjoiYmlrZWtlYXBwIiwiYSI6ImNsOWQ0enUzaTA1dGEzb2w5cHBnd2g2cTUifQ.bvZzCcgCbJ3w_dfddXw7zg'),
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: AppConstants.myLocation,
              onMapReady: () {
                setState(() {});
              },
              onPositionChanged: ((position, hasGesture) {
                Location location = Location();
                location.getLocation().then((location) {
                  currentLocation = location;
                });

                location.onLocationChanged.listen((newLoc) {
                  currentLocation = newLoc;
                  mapController.move(
                      AppConstants().getLoc(currentLocation!), 18.0);
                  setState(() {});
                });
              }),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/bikekeapp/cl8rjpomp000n15t76z5cj7a9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYmlrZWtlYXBwIiwiYSI6ImNsOHJqbWZ2ajBiejAzd2xsZWt4czNlbmYifQ.wmJpDo_8Kp3y4mdjQchICg",
                additionalOptions: {
                  'mapStyleId': AppConstants.mapBoxStyleId,
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
              MarkerLayer(
                markers: [
                  Marker(
                      point: AppConstants().getLoc(currentLocation!),
                      builder: (_) {
                        return Icon(FontAwesomeIcons.arrowUp);
                      })
                ],
              )
            ],
          ),
          Positioned(
            child: IconButton(
                onPressed: () async {
                  await Future.delayed(Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                },
                icon: Icon(
                  FontAwesomeIcons.arrowLeftLong,
                  color: Colors.red,
                  size: 20,
                )),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Hi there!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Text('You are currently here:'),
                      const Text('<Show the current address here>',
                          style: TextStyle(color: Colors.indigo)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Where do you wanna go today?'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
