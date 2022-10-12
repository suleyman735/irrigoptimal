import 'package:flutter/material.dart';

class MyLoginFormField extends StatelessWidget {
  final Function? validator;
  final Function? onChanged;
  final String name;

  const MyLoginFormField(
      {super.key, required this.name, this.validator, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == "") {
          return "Please Fill Your Login";
        } else if (value!.length < 4) {
          return "Login is Too Short";
        }
        return "";
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintStyle: const TextStyle(color: Colors.black),
        hintText: name,
      ),
      // onChanged: onChanged,
    );
  }
}
