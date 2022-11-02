import 'package:bikeke_app/design/app_color.dart';
import 'package:flutter/material.dart';

class SetTrip extends StatefulWidget {
  SetTrip({super.key});

  @override
  State<SetTrip> createState() => _SetTripState();
}

class _SetTripState extends State<SetTrip> {
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
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            color: AppColor().secondBackgroudColor(),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(20),
        width: double.infinity,
        height: 300,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Router:"),
                  Spacer(),
                  Container(
                    width: 250,
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
                  Spacer(),
                  Container(
                    width: 250,
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
              SizedBox(
                height: 47,
                width: 129,
                child: FloatingActionButton(
                    backgroundColor: Colors.orangeAccent,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed: () {},
                    child: Text('Confirm')),
              )
            ],
          ),
        ),
      ),
      Text('Trip Today'),
      Expanded(
        child: SingleChildScrollView(
          child: Container(
            height: 500,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColor().secondBackgroudColor(),
                borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Container(
                margin: EdgeInsets.all(20),
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
              )
            ]),
          ),
        ),
      ),
    ]);
  }
}
