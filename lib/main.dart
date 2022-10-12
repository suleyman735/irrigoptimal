import 'package:flutter/material.dart';
import 'package:irrigoptimal/Screens/irrig_start.dart';

import 'Screens/home_page.dart';
import 'Screens/login.dart';
import 'Widgets/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartIrrig(),
    );
  }
}
