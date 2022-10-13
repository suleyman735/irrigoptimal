import 'package:flutter/material.dart';

import '../main.dart';

class Button extends StatelessWidget {
  const Button({super.key});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
      primary: style.accentColor,
      onPrimary: Colors.white,
      //shadowColor: Colors.greenAccent,
      elevation: 0,
      padding: EdgeInsets.all(18),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)),
      minimumSize: Size(double.infinity, 60),
    ),  child: Text('Login', style: TextStyle(fontSize: style.getTextSize(style.textScale, 8+15),fontWeight: FontWeight.w600),));

  }
}
