import 'package:bikeke_app/Customer/assets/data.dart';
import 'package:bikeke_app/Customer/components/TabView/ConfirmTab.dart';
import 'package:bikeke_app/Customer/components/TabView/LIstFrom.dart';
import 'package:bikeke_app/Customer/components/TabView/LIstTo.dart';
import 'package:bikeke_app/Customer/components/TabView/ListSlot.dart';
import 'package:bikeke_app/Customer/components/NavBar.dart';
import 'package:bikeke_app/Customer/components/TabView/PaymentMethod.dart';
import 'package:bikeke_app/Customer/components/TabView/WatitingTab.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class bookingScreen extends StatefulWidget {
  int tabIndex;
  Booking booking;
  bookingScreen(this.tabIndex, this.booking);
  @override
  State<bookingScreen> createState() => _bookingScreenState();
}

class _bookingScreenState extends State<bookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int count = 0;
  String Button = "Continue";

  callback(Booking bookingValue) {
    setState(() {
      widget.booking.slot = bookingValue.slot;
      widget.booking.from = bookingValue.from;
      widget.booking.to = bookingValue.to;
      widget.booking.cost = bookingValue.cost;
      widget.booking.date = bookingValue.date;
    });
  }

  void incrementCounter() {
    setState(() {
      count < 6 ? count++ : count = 5;
    });
    _tabController.index == 5
        ? _tabController.animateTo((5))
        : _tabController.animateTo((_tabController.index + 1));
    checkState();
  }

  void resetCounter() {
    // setState(() {
    //   count = 0;
    // });
    _tabController.index = 0;
    setState(() {
      Button = "Continue";
    });
  }

  void clickTab(index) {
    if (index > count) {
      _tabController.index = count;
    }
  }

  void checkState() {
    if (_tabController.index == 4) {
      setState(() {
        Button = "Conform";
      });
    }
    if (_tabController.index == 5) {
      setState(() {
        Button = "Cancel";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
    _tabController.index = widget.tabIndex;
  }

  @override
  void dispose() {
    //_tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Booking'),
          backgroundColor: Colors.orange,
        ),
        body: DefaultTabController(
          length: 5,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Column(children: <Widget>[
              Material(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                // borderRadius: BorderRadius.circular(12.0),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  onTap: (int index) {
                    // if (index == 0) {
                    //   return;
                    // }
                    clickTab(index);
                  },
                  unselectedLabelColor: Colors.black,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  indicator: BoxDecoration(
                    color: _tabController.index == 5
                        ? Colors.white
                        : Colors.orange,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  tabs: [
                    Container(
                      width: 30.0,
                      child: Tab(text: '1'),
                    ),
                    Container(
                      width: 30.0,
                      child: Tab(text: '2'),
                    ),
                    Container(
                      width: 30.0,
                      child: Tab(text: '3'),
                    ),
                    Container(
                      width: 30.0,
                      child: Tab(text: '4'),
                    ),
                    Container(
                      width: 30.0,
                      child: Tab(text: '5'),
                    ),
                    Container(
                      width: 30.0,
                      //child: Tab(text: '6'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListSlot(widget.booking, callback),
                    ListFrom(widget.booking, callback),
                    ListTo(widget.booking, callback),
                    PaymentMethod(widget.booking, callback),
                    ConfirmTab(widget.booking, callback),
                    WaitingTab(widget.booking, callback),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 160, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () => (Button == "Cancel"
                      ? resetCounter()
                      : incrementCounter()),
                  child: Text(
                    "$Button",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
        bottomNavigationBar: NavBar());
  }
}
