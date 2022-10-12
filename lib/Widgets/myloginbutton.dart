import 'package:flutter/material.dart';
// import '../screens/signup.dart';
import '../screens/login.dart';

class MyLoginButton extends StatelessWidget {
  // const MyButton({Key? key}) : super(key: key);

  final VoidCallback onPressed;
  final String name;
  MyLoginButton({required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        child: Text(name),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor,),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
