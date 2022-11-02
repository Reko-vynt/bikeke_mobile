import 'dart:ffi';

import 'package:bikeke_app/layout/widget/bookers.dart';
import 'package:bikeke_app/layout/widget/set_trip.dart';
import 'package:flutter/material.dart';
import 'package:bikeke_app/layout/widget/bottom_nav_driver.dart';
import 'package:bikeke_app/layout/widget/appbar_driver.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        AppbarDriver(
          titleString: 'Plan',
          implementLeading: true,
          height: 61,
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(top: 61),
          child: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: Colors.red),
              insets: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Set a Trip',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
              ),
              Tab(
                child: Text(
                  'Bookers',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 112),
          child: TabBarView(
              controller: _tabController, children: [SetTrip(), Booker()]),
        )
      ]),
      bottomNavigationBar: BottomNavBarDriver(),
    );
  }
}
