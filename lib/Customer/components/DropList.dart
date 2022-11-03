// import 'package:bikeke_app/Customer/assets/data.dart';

// import 'package:dropdown_button2/dropdown_button2.dart';

// import 'package:flutter/material.dart';

// class dropList extends StatefulWidget {
//   @override
//   State<dropList> createState() => _dropListState();
// }

// class _dropListState extends State<dropList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton2(
//             hint: Text(
//               'Select Item',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Theme.of(context).hintColor,
//               ),
//             ),
//             items: items
//                 .map((item) => DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(
//                         item,
//                         style: const TextStyle(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ))
//                 .toList(),
//             value: selectedValue,
//             onChanged: (value) => setState(() {
//               this.selectedValue = value;
//             }),
//             buttonHeight: 40,
//             buttonWidth: 140,
//             itemHeight: 40,
//           ),
//         ),
//       ),
//     );
//   }

//   var items = getRoute();
//   String? selectedValue;
// }
