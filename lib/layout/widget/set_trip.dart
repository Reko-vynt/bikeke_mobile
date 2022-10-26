import 'package:flutter/material.dart';

class SetTrip extends StatefulWidget {
  SetTrip({super.key});
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  final items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  State<SetTrip> createState() => _SetTripState();
}

class _SetTripState extends State<SetTrip> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        height: 300,
        color: Colors.blue,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Router:"),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      // Initial Value

                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      value: SetTrip().dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: SetTrip().items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          SetTrip().dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Router:"),
                  Spacer(),
                  Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      // Initial Value

                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      value: SetTrip().dropdownvalue,

                      // Down Arrow Icon
                      icon: Expanded(
                        child: Positioned(
                            right: 0,
                            child: const Icon(Icons.keyboard_arrow_down)),
                      ),

                      // Array list of items
                      items: SetTrip().items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          SetTrip().dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Text('Trip Today'),
      Container(
        height: 50,
        color: Colors.blue,
      ),
    ]);
  }
}
