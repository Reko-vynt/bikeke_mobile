import 'package:bikeke_app/design/app_color.dart';
import 'package:flutter/material.dart';

class Booker extends StatefulWidget {
  const Booker({super.key});

  @override
  State<Booker> createState() => _BookerState();
}

class _BookerState extends State<Booker> with AutomaticKeepAliveClientMixin {
  String dropdownslot = 'Slot 1';
  String dropdownroute = 'Route 1';

  // List of items in our dropdown menu
  final slots = [
    'Slot 1',
    'Slot 2',
    'Slot 3',
    'Slot 4',
    'Slot 5',
  ];
  final router = [
    'Route 1',
    'Route 2',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: AppColor().secondBackgroudColor(),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      width: width * 0.8,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text("Router:"),
                Container(
                  width: 100,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    // Initial Value

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    value: dropdownroute,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: router.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownroute = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Slot:"),
                Container(
                  width: 100,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    // Initial Value

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    value: dropdownslot,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: slots.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownslot = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 400,
                child: ListView(padding: EdgeInsets.all(10), children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ]),
              ),
            ],
          ),
        )
      ]),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
