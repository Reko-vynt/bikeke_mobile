import 'dart:async';

import 'package:bikeke_app/helpers/mapbox_handler.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final Completer<MapboxMapController> _controller = Completer();
  LocationData? currentLocation;
  MapboxMapController? mapController;
  late Map geometry;
  Future<Symbol>? driver;
  static const LatLng driverLatlng = LatLng(21.050836, 105.804941);
  static const LatLng userLatlng = LatLng(21.050562, 105.802962);
  // final Completer<MapboxMapController> _controller = Completer();
  // final LatLng _currentLocation = getCurrentLatLngFromSharedPrefs();
  // LocationData? currentLocation;
  // MapboxMapController? mapController;
  Future<void> getLocation() async {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });
    mapController = await _controller.future;
    location.onLocationChanged.listen((newLoc) async {
      currentLocation = newLoc;
      if (mounted) {
        updateSymbol();
        setState(() {});
      }
    });
  }

  void initializeLocationAndSave() async {
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
    }
  }

// For controlling the view of the Map
  final CameraPosition _initialLocation =
      CameraPosition(target: driverLatlng, zoom: 20);
  void setPolyline() async {
    mapController = await _controller.future;
    Map modifiedResponse =
        await getDirectionsAPIResponse(driverLatlng, userLatlng);
    geometry = modifiedResponse['geometry'];

    final _fills = {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "id": 0,
          "properties": <String, dynamic>{},
          "geometry": geometry,
        },
      ],
    };

    // Add new source and lineLayer
    await mapController?.addSource(
        "fills", GeojsonSourceProperties(data: _fills));
    await mapController?.addLineLayer(
      "fills",
      "lines",
      LineLayerProperties(
        lineColor: Colors.indigo.toHexStringRGB(),
        lineCap: "round",
        lineJoin: "round",
        lineWidth: 5,
      ),
    );
    mapController?.addSymbol(SymbolOptions(
        iconImage: 'assets/images/marker-icon.png',
        iconSize: 0.3,
        iconColor: 'red',
        geometry: driverLatlng));
    driver = mapController?.addSymbol(SymbolOptions(
        iconImage: 'assets/images/marker-icon.png',
        iconSize: 0.3,
        iconColor: 'red',
        geometry: userLatlng));
  }

  updateSymbol() async {
    mapController = await _controller.future;
    Symbol? drivers = await driver;
    mapController?.updateSymbol(
        drivers!,
        SymbolOptions(
            iconImage: 'assets/images/marker-icon.png',
            iconSize: 0.3,
            geometry: LatLng(
                currentLocation!.latitude!, currentLocation!.longitude!)));
  }

  @override
  void initState() {
    initializeLocationAndSave();
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
          MapboxMap(
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
              onStyleLoadedCallback: updateSymbol,
              myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
              initialCameraPosition: _initialLocation,
              accessToken:
                  'sk.eyJ1IjoiYmlrZWtlYXBwIiwiYSI6ImNsOXhkM2hpbjA5Zjgzb3BudTRzenE4cmgifQ.uxW9g_kHepSWSnZ3NA7qTw'),
          // FlutterMap(
          //   mapController: mapController,
          //   options: MapOptions(
          //     minZoom: 5,
          //     maxZoom: 18,
          //     zoom: 13,
          //     center: AppConstants.myLocation,
          //     onMapReady: () {
          //       setState(() {});
          //     },
          //     onPositionChanged: ((position, hasGesture) {
          //       Location location = Location();
          //       location.getLocation().then((location) {
          //         currentLocation = location;
          //       });

          //       location.onLocationChanged.listen((newLoc) {
          //         currentLocation = newLoc;
          //         mapController.move(
          //             AppConstants().getLoc(currentLocation!), 18.0);
          //         setState(() {});
          //       });
          //     }),
          //   ),
          //   children: [
          //     TileLayer(
          //       urlTemplate:
          //           "https://api.mapbox.com/styles/v1/bikekeapp/cl8rjpomp000n15t76z5cj7a9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYmlrZWtlYXBwIiwiYSI6ImNsOHJqbWZ2ajBiejAzd2xsZWt4czNlbmYifQ.wmJpDo_8Kp3y4mdjQchICg",
          //       additionalOptions: {
          //         'mapStyleId': AppConstants.mapBoxStyleId,
          //         'accessToken': AppConstants.mapBoxAccessToken,
          //       },
          //     ),
          //     MarkerLayer(
          //       markers: [
          //         Marker(
          //             point: AppConstants().getLoc(currentLocation!),
          //             builder: (_) {
          //               return Icon(FontAwesomeIcons.arrowUp);
          //             })
          //       ],
          //     )
          //   ],
          // ),
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
            child: IconButton(
                onPressed: () {
                  setPolyline();
                },
                icon: Icon(
                  FontAwesomeIcons.arrowLeftLong,
                  color: Colors.red,
                  size: 20,
                )),
          ),
        ],
      ),
    );
  }
}
