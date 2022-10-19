import 'package:flutter/material.dart';
import 'package:irrigoptimal/Screens/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:irrigoptimal/Screens/irrigation_page.dart';

import 'Screens/login.dart';
import 'Widgets/register.dart';
import 'constant/style.dart';

void main() {
  runApp(MyApp());
}

Style style = new Style();


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // Locale? _locale;

//   void setLocale(Locale locale) {
//     setState(() {
//       _locale = locale;
//     });
//   }
//
//   String _name = _mariaName;
//
//   void _changeName(String name) {
//     setState(() {
//       _name = name;
//     });
//   }
// >>>>>>> b9ef13ac6d1f677a2ce9c34e141f9bbbf3e67b60



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // locale: _locale,
      theme: ThemeData(
          fontFamily: 'Poppins',

      ),
      home: MyHomePage(),

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

    );
  }
}
// MyHomePage(setLocale)

// class MyHomePage extends StatefulWidget {
//   MyHomePage(this.setLocale, {super.key});
//
//   final void Function(Locale locale) setLocale;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context)!.initialMessage),
//       ),
//       body: SafeArea(
//         child: Container(
//           color: Theme.of(context).primaryColor,
//           child: Column(children: [
//             ElevatedButton(
//               onPressed: () {
//                 widget.setLocale(
//                   Locale.fromSubtags(languageCode: 'en'),
//                 );
//               },
//               child: Text('English'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 widget.setLocale(
//                   Locale.fromSubtags(languageCode: 'it'),
//                 );
//               },
//               child: Text('Italian'),
//             ),
//             Text(AppLocalizations.of(context)!.language),
//             Text(Localizations.localeOf(context).toString()),
//           ]),
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   static final String title = 'Dropdown Button';
//
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(primarySwatch: Colors.deepOrange),
//         home: MainPage(title: title),
//       );
// }
//
// class MainPage extends StatefulWidget {
//   final String title;
//
//   const MainPage({
//     required this.title,
//   });
//
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class NewObject {
//   final String title;
//   final IconData icon;
//
//   NewObject(this.title, this.icon);
// }
//
// class _MainPageState extends State<MainPage> {
//   static final List<NewObject> items = <NewObject>[
//     NewObject('Apple', Icons.access_alarms),
//     NewObject('Banana', Icons.mail),
//     NewObject('Orange', Icons.account_balance_wallet),
//     NewObject('Other Fruit', Icons.account_box),
//   ];
//   NewObject value = items.first;
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Center(
//           child: buildDropdown(),
//         ),
//       );
//
//   Widget buildDropdown() => Container(
//         width: 200,
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//           border: Border.all(color: Colors.deepOrange, width: 4),
//         ),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<NewObject>(
//             value: value, // currently selected item
//             items: items
//                 .map((item) => DropdownMenuItem<NewObject>(
//                       child: Row(
//                         children: [
//                           Icon(item.icon),
//                           const SizedBox(width: 8),
//                           Text(
//                             item.title,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                       value: item,
//                     ))
//                 .toList(),
//             onChanged: (value) => setState(() {
//               this.value = value!;
//             }),
//           ),
//         ),
//       );
// }
