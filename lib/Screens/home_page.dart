import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:irrigoptimal/Screens/field_information.dart';
import 'package:irrigoptimal/Screens/infofield.dart';
import 'package:irrigoptimal/Screens/irrigation_page.dart';
import 'package:irrigoptimal/main.dart';

import '../constant/field.dart';
import 'irrigation_page.dart';

const List<String> LanguageItems = <String>['Eng', 'It'];

class MyHomePage extends StatefulWidget {
  static const _title = 'Irrigation';
  MyHomePage(this.setLocale, {super.key});
  final void Function(Locale locale) setLocale;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const mariaName = 'Igla';

class _MyHomePageState extends State<MyHomePage> {
  void goToStartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IrrigationPage(title)),
    );
    print('start page');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IrrigationPage(title)),
    );
  }

  void goToHomePage(){

    setState((){

      title = 'Irrigoptimal';

      isCardEnabled = [false, false, false];

      navigationButtonAbilitation = {
        Icons.home: 1,
        Icons.info: 0,
        Icons.start: 0,
      };

    });

    print('home page');
  }

  void goToInfoPage() {
    print('info page');

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MyFieldsInfo(title, cropsName,
              lastIrrigAmount.toDouble(), recemonedAmount.toDouble())),
    );
  }

  Widget printIcon(int ab, IconData icon) {
    late Function pressFunction;
    if (icon == navigationButtonAbilitation.keys.elementAt(0)) {
      pressFunction = goToHomePage;
    } else if (icon == navigationButtonAbilitation.keys.elementAt(1)) {
      pressFunction = goToInfoPage;
    } else if (icon == navigationButtonAbilitation.keys.elementAt(2)) {
      pressFunction = goToStartPage;
    }

    if (ab == 1) {
      return IconButton(
        onPressed: () {
          pressFunction();
        },
        icon: Icon(icon),
      );
    } else {
      return IconButton(
        color: Colors.black.withOpacity(0.01),
        onPressed: null,
        icon: Icon(icon),
      );
    }
  }

  List<bool> isCardEnabled = [];
  String title = 'Irrigoptimal';
  String cropsName = '';
  late double lastIrrigAmount;
  late double recemonedAmount;

  Map<IconData, int> navigationButtonAbilitation = {
    Icons.home: 1,
    Icons.info: 0,
    Icons.start: 0,
  };

  String _name = mariaName;

  void _changeName(String name) {
    setState(() {
      _name = name;
    });
  }

  String dropdownValue = LanguageItems.first;

  final List<bool> _selectedDataButton = <bool>[true, false, false];

  String _text = 'Irrigation';
  void clickVisibleInvisible() {
    setState(() {
      if (navigationButtonAbilitation[Icons.info] == 0) {
        navigationButtonAbilitation[Icons.info] = 1;
        navigationButtonAbilitation[Icons.start] = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    style.isLandscape = mediaquery.orientation == Orientation.landscape;
    style.deviceWidth = mediaquery.size.width;
// the device height changes in the home page, because there is AppBar (we don't have it in login page)
//     style.deviceHeight = mediaquery.size.height -
//         mediaquery.padding.top -
//         appBar.preferredSize.height;
    if (style.isLandscape)
      style.textScale = mediaquery.size.width * 0.01;
    else
      style.textScale = mediaquery.size.height * 0.01;
    List<Field> fields = [];
    fields.add(Field('Gozo', 'Malta', 24, '', '', 'Orange', 3500, 5000));
    fields.add(Field('Catania', 'Italy', 22, '', '', 'Potate', 1000, 2000));

    return Scaffold(
      backgroundColor: style.backgroundColor,
      appBar: buildAppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Stack(children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'IrrigOptimal',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight + Alignment(0, .3),
                      child: Text(
                        'UserName',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight + Alignment(0, .3),
                      child: Text(
                        'Name Surname',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight + Alignment(0, .8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Active',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            ListTile(
              leading: Icon(Icons.place),
              title: Text('Fields'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.play_arrow),
              title: Text('Actuator'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help_center),
              title: Text('Support'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: const Text('Privacy'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: buildSingleChildScrollViewBodyPart(fields),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomAppBar(
                child: Container(

                  height: 60,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: navigationButtonAbilitation.entries.map((entry) {

                      var w = printIcon(entry.value ,entry.key);
                      return w;
                    }).toList(),

                  ),
                ),
              ),
            )
        )
    );
  }

  SingleChildScrollView buildSingleChildScrollViewBodyPart(List<Field> fields) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              //height: style.deviceHeight*getHeightTitleContainer(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      'Your fields',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: style.getTextSize(style.textScale, 30.0 + 15),
                      ),
                    ),
                  ),
                  Text(
                    '2 active fields',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0x3C000000),
                        fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2.4,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: fields.length,
                  itemBuilder: (BuildContext ctx, index) {
                    isCardEnabled.add(false);
                    return GestureDetector(
                      onTap: () {
                        clickVisibleInvisible();

                        setState(() {
                          isCardEnabled.replaceRange(0, isCardEnabled.length, [
                            for (int i = 0; i < isCardEnabled.length; i++) false
                          ]);
                          isCardEnabled[index] = true;

                          title = fields[index].fieldName;
                          cropsName = fields[index].cropsName;
                          lastIrrigAmount =
                              fields[index].fieldsLastIrrigAmount as double;
                          recemonedAmount =
                              fields[index].fieldsRecemonedAmount as double;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: style.inputFieldColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: isCardEnabled[index] == true
                                  ? style.accentColor.withOpacity(0.50)
                                  : style.accentColor.withOpacity(0.0),
                              spreadRadius: 5,
                              blurRadius: 15,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fields[index].fieldName,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              fields[index].fieldCountry,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: style.subtitleCard),
                            ),
                            Row(
                              children: [
                                Text(
                                  fields[index].temperature.toString() + ' °C',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: style.subtitleCard),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.sunny,
                                  color: style.subtitleCard,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              fields[index].cropsName,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: style.backgroundColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black, size: 35),
      title: Text(style: TextStyle(color: style.accentColor), title),
      centerTitle: true,
      actions: [
        DropdownButton<String>(
          value: dropdownValue,
          // icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;

              if (dropdownValue == "Eng") {
                widget.setLocale(const Locale.fromSubtags(languageCode: 'en'));
              } else if (dropdownValue == "It") {
                widget.setLocale(const Locale.fromSubtags(languageCode: 'it'));
              }

              // print(dropdownValue = 'En');
            });
          },
          items: LanguageItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Language Button // if chose any language you can show all page
  // DropdownButton<String> buildDropdownLanguageButton() {
  //   return DropdownButton<String>(
  //     value: dropdownValue,
  //     // icon: const Icon(Icons.arrow_downward),
  //     elevation: 16,
  //     style: const TextStyle(color: Colors.deepPurple),
  //     onChanged: (String? value) {
  //       // This is called when the user selects an item.
  //       setState(() {
  //         dropdownValue = value!;
  //
  //         if (dropdownValue == "Eng") {
  //           widget.setLocale(const Locale.fromSubtags(languageCode: 'en'));
  //         } else if (dropdownValue == "It") {
  //           widget.setLocale(const Locale.fromSubtags(languageCode: 'it'));
  //         }
  //
  //         // print(dropdownValue = 'En');
  //       });
  //     },
  //     items: LanguageItems.map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       );
  //     }).toList(),
  //   );
  // }
}

// for language
// Text(AppLocalizations.of(context)!.initialMessage)

final Map<IconData, int> navigationButtonAbilitation = {
  Icons.home: 1,
  Icons.info: 0,
  Icons.start: 0,
};
