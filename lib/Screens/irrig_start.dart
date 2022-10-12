import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

// class StartIrrig extends StatelessWidget {
//   const StartIrrig({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [Text('Start IRRIG')],
//       ),
//     );
//   }
// }
const List<Widget> icons = <Widget>[
  Icon(Icons.sunny),
  Icon(Icons.cloud),
  Icon(Icons.ac_unit),
];

class StartIrrig extends StatefulWidget {
  const StartIrrig({Key? key}) : super(key: key);

  @override
  State<StartIrrig> createState() => _StartIrrigState();
}

class _StartIrrigState extends State<StartIrrig> {
  final List<bool> _selectedWeather = <bool>[false, false, true];
  List<bool> isSelected = [true, true];
  TextEditingController textEditingController = TextEditingController();
  //static ValueNotifier<bool> enteredValue = ValueNotifier(true);
  @override
  Widget build(BuildContext startIrrigContext) {
    return Scaffold(
      body: Center(
        child: ToggleButtons(
          direction: Axis.vertical,
          onPressed: (int index) {
            setState(() {
              // The button that is tapped is set to true, and the others to false.
              for (int i = 0; i < _selectedWeather.length; i++) {
                if (_selectedWeather[i] = i == index) {
                  ScaffoldMessenger.of(startIrrigContext).showSnackBar(SnackBar(
                    content: Row(
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('hhh'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('hhh'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
                  // ScaffoldMessenger.of(startIrrigContext)
                  //     .showSnackBar(SnackBar(content: new Text('data')));
                  print(widget.createElement().state);
                }
                ;
              }
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.blue[700],
          selectedColor: Colors.white,
          fillColor: Colors.blue[200],
          color: Colors.blue[400],
          isSelected: _selectedWeather,
          children: icons,
        ),
      ),
      appBar: AppBar(backgroundColor: Colors.red),
      bottomNavigationBar: bottombar(
        enabled: false,
      ),
    );
  }
}

class bottombar extends StatelessWidget {
  static ValueNotifier<String> enteredValue = ValueNotifier('');

  bool enabled = false;
  bottombar({Key? key, required this.enabled}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
          child: Visibility(
        visible: enabled,
        child: BottomAppBar(
          child: ElevatedButton(child: Text('data'), onPressed: () {}),
        ),
      ));
}

// ValueListenableBuilder(
// valueListenable: enteredValue,
// builder: (BuildContext context String newValue, Widget child) {return Visibility(child: ElevatedButton(onPressed: null,child: Text('hello'),),visible: enteredValue,); ,},
// ),
