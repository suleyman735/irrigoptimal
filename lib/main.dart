import 'package:flutter/material.dart';
import 'package:irrigoptimal/Screens/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:irrigoptimal/Widgets/myloginfield.dart';
import 'Screens/field_information.dart';
import 'Screens/home_page.dart';

import 'Screens/login.dart';
import 'Widgets/register.dart';
import 'constant/style.dart';

void main() {
  runApp(const MyApp());
}

Style style = Style();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme:
          ThemeData(fontFamily: 'Poppins', backgroundColor: style.accentColor),
      home: MyHomePage(setLocale),
      // MyHomePage(setLocale),
    );
  }
}
