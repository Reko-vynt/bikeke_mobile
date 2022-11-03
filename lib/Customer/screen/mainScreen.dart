//import 'dart:html';

import 'package:bikeke_app/Customer/assets/data.dart';
import 'package:bikeke_app/Customer/components/NavBar.dart';
import 'package:bikeke_app/Customer/screen/bookingScreen.dart';
import 'package:flutter/material.dart';

import '../components/RecentBooking.dart';

// ignore: must_be_immutable
class mainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ListUser = getUser();
    var user = ListUser[0];
    var defaultTab = 0;
    var confirmTab = 4;

    Booking booking2 = new Booking("", "", "", "", "", "");

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 237, 231),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(10.0), // here the desired height
            child: AppBar(
              backgroundColor: Color.fromARGB(255, 255, 160, 0),
              elevation: 0.0,
              leading: Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  top: 12.0,
                  bottom: 12.0,
                  right: 12.0,
                ),
              ),
            )),
        body: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            constraints: BoxConstraints.expand(),
            color: Colors.white,
            child: Column(children: <Widget>[
              Row(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Image.asset(
                      user.avtURL,
                      width: 75,
                      height: 75,
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                      child: Column(
                    children: <Widget>[
                      Row(children: [
                        Text("Welcome, " + user.name,
                            style: TextStyle(fontSize: 20))
                      ]),
                      SizedBox(
                        height: 5,
                      ),
                      Row(children: [Text("Point: 200.000")]),
                      SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                        ElevatedButton(
                            onPressed: () {}, child: Text("Sign Out"))
                      ]),
                    ],
                  )),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                              color: Colors.black,
                              width: 4.0,
                              style: BorderStyle.solid)),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(Icons.notifications),
                            tooltip: 'Follow',
                            onPressed: () {},
                          ))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Row(
              //   children: [
              //     Container(
              //       child: Text("From: "),
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     Container(
              //       width: 300,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(50)),
              //       ),
              //       child: dropList(),
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   children: [
              //     Container(
              //       child: Text("To: "),
              //     ),
              //     SizedBox(
              //       width: 28,
              //     ),
              //     Container(
              //       width: 300,
              //       height: 50,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(50)),
              //       ),
              //       child: dropList(),
              //     )
              //   ],
              // ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50.0,
                    width: 450,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    bookingScreen(defaultTab, booking2)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 160, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        "Booking",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 5,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Recent Booking :",
                          style: TextStyle(fontSize: 24)))),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 210, 159),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: ListView.builder(
                    itemCount: listBookings.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var booking = listBookings[index];
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        bookingScreen(confirmTab, booking)));
                          },
                          child: Column(
                            children: [
                              index == 0
                                  ? BokkingCard(booking: booking)
                                  : BokkingCard(booking: booking),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ])),
        bottomNavigationBar: NavBar());
  }

  List<Booking> listBookings = getBookings();
}
