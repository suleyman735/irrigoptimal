import 'package:flutter/material.dart';

import '../main.dart';

class MyLoginFormField extends StatelessWidget {
  final Function? validator;
  final Function? onChanged;
  final String name;
  final double fontSize;

  const MyLoginFormField(
      {super.key, required this.name, required this.fontSize, this.validator, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return
      Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(name, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),),

          SizedBox(height: 15,),

          TextFormField(
          validator: (value) {
            if (value == "") {
              return "Please Fill Your Login";
            } else if (value!.length < 4) {
              return "Login is Too Short";
            }
            return "";
          },
          style: TextStyle(fontSize: fontSize-3),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: style.inputFieldColor,
            hintStyle: const TextStyle(color: Colors.black),

            //hintText: name,
          ),


          // onChanged: onChanged,
    ),
        ],
      );
  }
}
