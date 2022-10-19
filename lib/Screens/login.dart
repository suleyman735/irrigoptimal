import 'package:flutter/material.dart';
import 'package:irrigoptimal/Screens/home_page.dart';
import 'package:irrigoptimal/constant/style.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Widgets/button.dart';
import '../Widgets/changescreen.dart';
import '../Widgets/mylogin_password.dart';
import '../Widgets/myloginbutton.dart';
import '../Widgets/myloginfield.dart';
import '../Widgets/register.dart';
import '../main.dart';

Style style = new Style();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Locale? _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  double getWidthFormContainer() {
    if (style.deviceWidth > 700) {
      return style.deviceWidth * 0.7;
    } else {
      return style.deviceWidth * 1;
    }
  }

  double getHeightTitleContainer() {
    if (style.isLandscape) {
      if (style.deviceWidth > 700)
        return 0.30;
      else
        return 0.43;
    } else {
      return 0.25;
    }
  }

  double getHeightFormContainer(double height) {
    if (style.isLandscape) {
      return 570;
    } else {
      return height * 0.75;
    }
  }

  String? email;
  String? password;
  bool obserText = true;
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    style.isLandscape = mediaquery.orientation == Orientation.landscape;
    style.deviceWidth = mediaquery.size.width;
    double deviceHeight = mediaquery.size.height - mediaquery.padding.top;

    if (style.isLandscape)
      style.textScale = mediaquery.size.width * 0.01;
    else
      style.textScale = mediaquery.size.height * 0.01;

    return Scaffold(
      backgroundColor: style.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: getWidthFormContainer(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: deviceHeight * getHeightTitleContainer(),
                      width: double.infinity,
                      padding: EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Irrigoptimal',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  style.getTextSize(style.textScale, 40.0 + 15),
                            ),
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize:
                                  style.getTextSize(style.textScale, 32 + 15),
                              fontWeight: FontWeight.w600,
                              color: style.accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: getHeightFormContainer(deviceHeight),
                      width: double.infinity,
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: [
                          MyLoginFormField(
                            name: 'Email',
                            fontSize:
                                style.getTextSize(style.textScale, 8 + 15),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          PasswordLoginField(
                            obserText: obserText,
                            name: "Password",
                            fontSize:
                                style.getTextSize(style.textScale, 8 + 15),
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
                            height: 55,
                          ),
                          Button(),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => MyHomePage(setLocale),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Privacy',
                                    style: TextStyle(
                                        fontSize: style.getTextSize(
                                            style.textScale, 8 + 15),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
