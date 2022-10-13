import 'package:flutter/material.dart';

import '../main.dart';


class PasswordLoginField extends StatelessWidget {
  final bool obserText;
  final Function validator;
  final String name;
  final double fontSize;
  final VoidCallback onTap;
  final ValueChanged<String>? onChanged;

  const PasswordLoginField(
      {super.key,
      required this.onTap,
      required this.obserText,
      required this.validator,
      required this.name,
      required this.fontSize,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,


      children: [

        Text(name, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),),

        SizedBox(height: 15,),


        TextFormField(
          obscureText: obserText,
          onChanged: onChanged,
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

            suffixIcon: GestureDetector(
              onTap: onTap,
              child: Icon(
                  obserText == true ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black, ),
            ),
          ),
        ),
      ],
    );
  }
}
