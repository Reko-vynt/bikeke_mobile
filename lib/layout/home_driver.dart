import 'package:bikeke_app/design/app_color.dart';
import 'package:bikeke_app/layout/map_driver.dart';
import 'package:bikeke_app/layout/widget/appbar_driver.dart';
import 'package:bikeke_app/layout/widget/bottom_nav_driver.dart';
import 'package:bikeke_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class HomeDriver extends StatelessWidget {
  const HomeDriver({Key? key, this.userName = 'Driver'}) : super(key: key);
  void initializeLocationAndSave() async {
    // Ensure all permissions are collected for Locations
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

    // Get the current user location
    LocationData _locationData = await _location.getLocation();

    // Get the current user address

    // Store the user location in sharedPreferences
    sharedPreferences.setDouble('latitude', _locationData.latitude!);
    sharedPreferences.setDouble('longitude', _locationData.longitude!);
  }

  final String? userName;
  @override
  Widget build(BuildContext context) {
    initializeLocationAndSave();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      body: Stack(children: [
        AppbarDriver(
          title: Row(children: [
            Row(
              children: [
                CircleAvatar(),
                Text(
                  'Welcome,$userName',
                  style: TextStyle(color: AppColor().textColor()),
                )
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Icon(
                      FontAwesomeIcons.bell,
                      size: 20,
                      color: Colors.black,
                    ))
              ],
            )
          ]),
          implementLeading: true,
          titleString: "Plan",
        ),
        Container(
          margin: EdgeInsets.only(top: 103),
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      FloatingActionButton(
                        heroTag: "f1",
                        onPressed: () {},
                        child: Icon(FontAwesomeIcons.avianex),
                      ),
                      Text('Work'),
                    ],
                  ),
                  Column(children: [
                    FloatingActionButton(
                      heroTag: "f2",
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Home()));
                      },
                      child: Icon(FontAwesomeIcons.avianex),
                    ),
                    Text('Plan')
                  ])
                ],
              ),
              Text("Recent Trip:"),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white24,
                  ),
                  width: width * 0.9,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          color: Colors.black,
                          height: 100.0,
                          width: width * 0.6,
                        ),
                        Container(
                            color: Colors.black,
                            height: 100.0,
                            width: width * 0.6,
                            margin: EdgeInsets.only(bottom: 10)),
                        Container(
                            color: Colors.black,
                            height: 200.0,
                            width: width * 0.6,
                            margin: EdgeInsets.only(bottom: 10)),
                        Container(
                            color: Colors.black,
                            height: 100.0,
                            width: width * 0.6,
                            margin: EdgeInsets.only(bottom: 10)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavBarDriver(),
    );
  }
}
