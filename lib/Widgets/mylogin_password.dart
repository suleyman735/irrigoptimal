import 'package:flutter/material.dart';

class PasswordLoginField extends StatelessWidget {
  final bool obserText;
  final Function validator;
  final String name;
  final VoidCallback onTap;
  final ValueChanged<String>? onChanged;

  const PasswordLoginField(
      {super.key,
      required this.onTap,
      required this.obserText,
      required this.validator,
      required this.name,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obserText,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
              obserText == true ? Icons.visibility : Icons.visibility_off,
              color: Colors.black),
        ),
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
