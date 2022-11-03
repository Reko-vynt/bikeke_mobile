import 'package:bikeke_app/Customer/assets/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// ignore: must_be_immutable
class PaymentMethod extends StatefulWidget {
  Booking booking;
  Function(Booking) callback;
  PaymentMethod(this.booking, this.callback);
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  var cost = "20.000";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 250,
            child: FlutterMap(
              options: new MapOptions(
                center: LatLng(10.841122, 106.809965),
                zoom: 18.0,
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: () {},
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/pexinhpro26/cl9ps79th000r15nwixky2qer/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicGV4aW5ocHJvMjYiLCJhIjoiY2w5cHJ6M3hnMGJmajN2bXBhajl5NGQweCJ9.yrJWxXo_mVUI0q-7_yJqfg',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1IjoicGV4aW5ocHJvMjYiLCJhIjoiY2w5cHJ6M3hnMGJmajN2bXBhajl5NGQweCJ9.yrJWxXo_mVUI0q-7_yJqfg',
                    'id': 'mapbox.mapbox-streets-v8'
                  },
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(10.841122, 106.809965),
                      builder: (ctx) {
                        return Column(children: <Widget>[
                          Text(
                            "You",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                          Container(
                              child: Icon(
                            Icons.location_on,
                            size: 18,
                            color: Colors.blueAccent,
                          ))
                        ]);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
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
                  // padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  // decoration: BoxDecoration(
                  //   color: Color.fromARGB(255, 255, 255, 255),
                  //   borderRadius: BorderRadius.circular(12.0),
                  // ),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listPayment.length,
                    itemBuilder: (context, index) {
                      var payment = listPayment[index];
                      if (!widget.booking.from.isEmpty) {
                        if (listPayment[index].name == widget.booking.from) {
                          listPayment[index].isSelected = true;
                        }
                      }
                      ;
                      return InkWell(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < listPayment.length; i++) {
                                if (listPayment[i].isSelected = true) {
                                  listPayment[i].isSelected = false;
                                }
                              }
                              widget.booking.from = payment.name;
                              payment.isSelected = true;
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
                                      color: payment.isSelected
                                          ? Color.fromARGB(255, 85, 221, 92)
                                          : Colors.orange,
                                      width: 3),
                                ),
                                child: Center(
                                  child: Text(payment.name),
                                ),
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

  List<Payment> listPayment = getPayments();
}
