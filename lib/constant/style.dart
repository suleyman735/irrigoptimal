

import 'package:flutter/material.dart';

class Style{

  //colors
  Color backgroundColor = Colors.white;
  Color inputFieldColor = const Color(0xB4D9D9D9);
  Color accentColor = const Color(0xFF2797FF);

  //device settings
  late bool isLandscape;
  late double deviceWidth;
  late double textScale;

  //adaptive text
  double getTextSize(double scale,double size){
    double calc=size/10;
    return scale *calc;
  }

}