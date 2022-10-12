import 'package:flutter/material.dart';
import 'package:irrigoptimal/Screens/irrig_start.dart';

import 'package:irrigoptimal/Screens/irrig_stop.dart';

bool _enabled = false;

// class GeneralHomePage extends StatelessWidget {
//   const GeneralHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: 350,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//               image: AssetImage('../img/PNG_transparency_demonstration_1.png'),
//               fit: BoxFit.fitWidth,
//             )
//
//                 // color: Colors.green,
//                 ),
//           ),
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: size.height * 0.05,
//                     ),
//                     Text(
//                       "Smart Irrigation",
//                       style: Theme.of(context)
//                           .textTheme
//                           .displayMedium
//                           ?.copyWith(fontWeight: FontWeight.w400),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       "This is Smart Irrigation plant",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 10),
//                     const SizedBox(
//                       width: 200, // it just take 60% of total width
//                       child: Text(
//                         "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 100, // it just take the 50% width
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: 20,
//                           width: 60,
//                           color: Colors.green,
//                           child: const Text('active'),
//                         ),
//                         Container(
//                           height: 20,
//                           width: 60,
//                           color: Colors.yellow,
//                           child: const Text('inactive'),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Wrap(spacing: 20, runSpacing: 20, children: [
//                       FieldCard(
//                         fieldName: 'Field 1',
//                         activeColour: true,
//                         onPress: true,
//                         active: false,
//                       ),
//                     ]),
//                     // FieldCard(fieldName: '', activeColour: null,);
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class FieldCard extends StatefulWidget {
//   final String fieldName;
//   final bool activeColour;
//   final bool onPress;
//   late bool active;
//   FieldCard(
//       {super.key,
//       required this.fieldName,
//       required this.activeColour,
//       required this.onPress,
//       required this.active});
//
//   @override
//   State<FieldCard> createState() => _FieldCardState();
// }
//
// class _FieldCardState extends State<FieldCard> {
//   @override
//   Widget build(BuildContext context) {
//     var _onPressed;
//     if (_enabled) {
//       _onPressed = () {
//         print('tap');
//       };
//     }
//     return Column(
//       children: [
//         Container(
//           height: 65,
//           width: double.infinity,
//           color: Colors.red,
//           child: ElevatedButton(
//             style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(
//                     widget.activeColour ? Colors.green : Colors.yellow)),
//             onPressed: () {
//               if (widget.onPress) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const StartIrrig()),
//                 );
//                 setState(() {
//                   widget.active = !widget.active;
//                   _enabled = true;
//                   print(widget.active);
//                 });
//               } else {
//                 null;
//               }
//             },
//             child: Container(
//               padding: const EdgeInsets.all(15),
//               child: Row(
//                 children: [Text(widget.fieldName)],
//               ),
//             ),
//           ),
//         ),
//         Visibility(
//           visible: _enabled,
//           child: Column(
//             children: [
//               //   ListTile(
//               //     title: new ElevatedButton(
//               //         onPressed: _onPressed, child: Text('Irr Now')),
//               //   ),
//               //   ListTile(
//               //     title: new ElevatedButton(
//               //         onPressed: _onPressed, child: Text('Stop')),
//               //   ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ActiveInactive extends StatefulWidget {
//   const ActiveInactive({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<ActiveInactive> createState() => _ActiveInactiveState();
// }
//
// class _ActiveInactiveState extends State<ActiveInactive> {
//   bool _enabled = false;
//   @override
//   Widget build(BuildContext context) {
//     var _onPressed;
//     if (_enabled) {
//       _onPressed = () {
//         _onPressed = () {
//           print('enable');
//         };
//       };
//     }
//     ;
//     return Column(
//       children: [
//         const FieldCard(
//           fieldName: 'Field 1',
//           activeColour: true,
//           onPress: true,
//         ),
//         ListTile(
//           title:
//               new ElevatedButton(onPressed: _onPressed, child: Text('Irr Now')),
//         ),
//         ListTile(
//           title: new ElevatedButton(onPressed: null, child: Text('Irr Srop')),
//         )
//       ],
//     );
//   }
// }

// class FieldCard extends StatefulWidget {
//   final String fieldName;
//   final bool activeColour;
//   final bool onPress;
//
//   const FieldCard(
//       {super.key,
//       required this.fieldName,
//       required this.activeColour,
//       required this.onPress});
//
//   @override
//   State<FieldCard> createState() => _FieldCardState();
// }
//
// class _FieldCardState extends State<FieldCard> {
//   List<bool> isSelected = [true];
//   @override
//   Widget build(BuildContext context) => Container(
//         width: double.infinity,
//         // color: Colors.red,
//         child: ToggleButtons(
//           isSelected: isSelected,
//           color: Colors.red,
//           selectedColor: Colors.white,
//           fillColor: Colors.lightBlue.shade900,
//           renderBorder: false,
//           splashColor: Colors.red.withOpacity(0.5),
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 12),
//               child: Text('Field 2',
//                   style: TextStyle(
//                     fontSize: 18,
//                   )),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 12),
//               child: Text('Field 2',
//                   style: TextStyle(
//                     fontSize: 18,
//                   )),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 12),
//               child: Text('Field 3', style: TextStyle(fontSize: 18)),
//             ),
//           ],
//           onPressed: (int newIndex) {
//             setState(() {
//               for (int index = 0; index < isSelected.length; index++) {
//                 if (index == newIndex) {
//                   isSelected[index] = true;
//                 } else {
//                   isSelected[index] = false;
//                 }
//               }
//             });
//           },
//         ),
//       );
// }
