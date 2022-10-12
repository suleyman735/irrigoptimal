import 'package:flutter/material.dart';
import 'package:irrigoptimal/Screens/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Screens/login.dart';
import 'Widgets/register.dart';

void main() {
  runApp(const MyApp());
}

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
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0x2797FF))),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MyHomePage(setLocale),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(this.setLocale, {super.key});

  final void Function(Locale locale) setLocale;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(children: [
          ElevatedButton(
            onPressed: () {
              widget.setLocale(
                Locale.fromSubtags(languageCode: 'en'),
              );
            },
            child: Text('English'),
          ),
          ElevatedButton(
            onPressed: () {
              widget.setLocale(
                Locale.fromSubtags(languageCode: 'it'),
              );
            },
            child: Text('Italian'),
          ),
          Text(AppLocalizations.of(context)!.language)
        ]),
      ),
    );
  }
}
