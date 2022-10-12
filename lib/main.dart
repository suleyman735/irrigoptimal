import 'package:flutter/material.dart';

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

      theme:ThemeData(

          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0x2797FF))

      ),

      home: LoginPage(),
    );
  }
}
