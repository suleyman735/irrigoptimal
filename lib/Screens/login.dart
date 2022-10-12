import 'package:flutter/material.dart';

import '../Widgets/changescreen.dart';
import '../Widgets/mylogin_password.dart';
import '../Widgets/myloginbutton.dart';
import '../Widgets/myloginfield.dart';
import '../Widgets/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool obserText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'WELCOME TO IRRIGOPTIMAL ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const MyLoginFormField(
                  name: 'User Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                PasswordLoginField(
                  obserText: obserText,
                  name: "Password",
                  validator: (value) {
                    if (value == "") {
                      return "Please Fill Password";
                    } else if (value!.length < 8) {
                      return "Password is Too Short";
                    }
                    return "";
                  },
                  onChanged: (String value) async {
                    setState(() {
                      password = value;
                    });
                  },
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      obserText = !obserText;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                MyLoginButton(
                  onPressed: () {
                    //vaildation();
                    print('object');
                  },
                  name: 'Login',
                ),
                const SizedBox(
                  height: 15,
                ),
                // ChangeScreen(
                //     name: 'Join Us',
                //     whichAccount: 'You have no account',
                //     onTap: () {
                //       Navigator.of(context).pushReplacement(
                //         MaterialPageRoute(
                //             builder: (ctx) => const RegisterPage()),
                //       );
                //     })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
