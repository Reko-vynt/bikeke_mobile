import 'package:bikeke_app/Customer/assets/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:latlong2/latlong.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
//import 'package:latlong2/latlong.dart';

// ignore: must_be_immutable
class ListFrom extends StatefulWidget {
  Booking booking;
  Function(Booking) callback;
  ListFrom(this.booking, this.callback);
  @override
  State<ListFrom> createState() => _ListFromState();
}

class _ListFromState extends State<ListFrom> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Container(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height - 250,
          //   child: FlutterMap(
          //     options: new MapOptions(
          //       center: LatLng(10.841122, 106.809965),
          //       zoom: 18.0,
          //     ),
          //     nonRotatedChildren: [
          //       AttributionWidget.defaultWidget(
          //         source: 'OpenStreetMap contributors',
          //         onSourceTapped: () {},
          //       ),
          //     ],
          //     children: [
          //       TileLayer(
          //         urlTemplate:
          //             'https://api.mapbox.com/styles/v1/pexinhpro26/cl9ps79th000r15nwixky2qer/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicGV4aW5ocHJvMjYiLCJhIjoiY2w5cHJ6M3hnMGJmajN2bXBhajl5NGQweCJ9.yrJWxXo_mVUI0q-7_yJqfg',
          //         userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          //         additionalOptions: {
          //           'accessToken':
          //               'pk.eyJ1IjoicGV4aW5ocHJvMjYiLCJhIjoiY2w5cHJ6M3hnMGJmajN2bXBhajl5NGQweCJ9.yrJWxXo_mVUI0q-7_yJqfg',
          //           'id': 'mapbox.mapbox-streets-v8'
          //         },
          //       ),
          //       MarkerLayer(
          //         markers: [
          //           Marker(
          //             point: LatLng(10.841122, 106.809965),
          //             builder: (ctx) {
          //               return Column(children: <Widget>[
          //                 Text(
          //                   "You",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 10),
          //                 ),
          //                 Container(
          //                     child: Icon(
          //                   Icons.location_on,
          //                   size: 18,
          //                   color: Colors.blueAccent,
          //                 ))
          //               ]);
          //             },
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),

          MapboxMap(
              onMapCreated: (mapController) {},
              myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
              initialCameraPosition: CameraPosition(
                  target: LatLng(21.050836, 105.804941), zoom: 20),
              accessToken:
                  'sk.eyJ1IjoiYmlrZWtlYXBwIiwiYSI6ImNsOXhkM2hpbjA5Zjgzb3BudTRzenE4cmgifQ.uxW9g_kHepSWSnZ3NA7qTw'),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 260,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Select pick-up ponit",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: listFrom.length,
                    itemBuilder: (context, index) {
                      var from = listFrom[index];
                      if (!widget.booking.from.isEmpty) {
                        if (listFrom[index].name == widget.booking.from) {
                          listFrom[index].isSelected = true;
                        }
                      }
                      ;
                      return InkWell(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < listFrom.length; i++) {
                                if (listFrom[i].isSelected = true) {
                                  listFrom[i].isSelected = false;
                                }
                              }
                              widget.booking.from = from.name;
                              from.isSelected = true;
                              widget.callback(widget.booking);
                            });
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 350,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                      color: from.isSelected
                                          ? Color.fromARGB(255, 85, 221, 92)
                                          : Colors.orange,
                                      width: 3),
                                ),
                                child: Center(
                                  child: Text(from.name),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ));
                    },
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  List<From> listFrom = getFroms();
}
