import 'package:flutter/material.dart';
import 'package:irrigoptimal/Screens/home_page.dart';

import '../constant/field.dart';

class MyCropsPage extends StatefulWidget {
  const MyCropsPage({Key? key}) : super(key: key);

  @override
  State<MyCropsPage> createState() => _MyCropsPageState();
}

class _MyCropsPageState extends State<MyCropsPage> {
  String title = 'ALL Crops';
  @override
  Widget build(BuildContext context) {
    List<Crops> cropsAll = [];
    cropsAll.add(Crops('Orange', 'Malta', 24, 'Irrigation system'));
    cropsAll.add(Crops('Apple', 'Italy', 22, 'Irrigation system'));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: cropsAll.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red,
                        spreadRadius: 4,
                        blurRadius: 15,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(cropsAll[index].cropsName,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    for (var i = 0; i < cropsAll.length; i++) {
                      title = cropsAll[index].cropsName;
                    }
                    print('object');
                  });
                },
              );
            },
          )),
    );
  }
}

// class MyFieldInformation extends StatefulWidget {
//   @override
//   State<MyFieldInformation> createState() => _MyFieldInformationState();
// }
//
// class _MyFieldInformationState extends State<MyFieldInformation> {
//   @override
//   Widget build(BuildContext context) {
//     final mediaquery = MediaQuery.of(context);
//     style.isLandscape = mediaquery.orientation == Orientation.landscape;
//     style.deviceWidth = mediaquery.size.width;
// // the device height changes in the home page, because there is AppBar (we don't have it in login page)
// //     style.deviceHeight = mediaquery.size.height -
// //         mediaquery.padding.top -
// //         appBar.preferredSize.height;
//     if (style.isLandscape)
//       style.textScale = mediaquery.size.width * 0.01;
//     else
//       style.textScale = mediaquery.size.height * 0.01;
//     List<Field> fields = [];
//     fields.add(Field('Gozo', 'Malta', 24, 'Irrigation system'));
//     fields.add(Field('Catania', 'Italy', 22, 'Irrigation system'));
//     fields.add(Field('Madrid', 'Spain', 25, 'Irrigation system'));
//     fields.add(Field('Madrid', 'Spain', 25, 'Irrigation system'));
//     return Scaffold(
//       appBar: buildAppBar(),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Stack(children: [
//                 Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         'IrrigOptimal',
//                         style: TextStyle(color: Colors.white, fontSize: 20.0),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight + Alignment(0, .3),
//                       child: Text(
//                         'UserName',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight + Alignment(0, .3),
//                       child: Text(
//                         'Name Surname',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight + Alignment(0, .8),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(5.0),
//                           child: Text(
//                             'Active',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ]),
//             ),
//             ListTile(
//               leading: Icon(Icons.place),
//               title: Text('Fields'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.play_arrow),
//               title: Text('Actuator'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.help_center),
//               title: Text('Support'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.privacy_tip),
//               title: const Text('Privacy'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.exit_to_app),
//               title: const Text('Logout'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: buildSingleChildScrollViewBodyPart(fields),
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: navigationButtonAbilitation.entries.map((entry) {
//               // var w = Text(entry.value);
//               //doSomething(entry.key);
//
//               //var w = IconButton(onPressed: () {  }, icon: Icon(entry.key),);
//               var w = printIcon(entry.value, entry.key);
//               print(w);
//               return w;
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget build(BuildContext context) {
//     List<Crops> cropsAll = [];
//     cropsAll.add(Crops('Gozo', 'Malta', 24, 'Irrigation system'));
//     cropsAll.add(Crops('Catania', 'Italy', 22, 'Irrigation system'));
//     cropsAll.add(Crops('Madrid', 'Spain', 25, 'Irrigation system'));
//     cropsAll.add(Crops('Madrid', 'Spain', 25, 'Irrigation system'));
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlueAccent,
//         title: Text('Malta'),
//         centerTitle: true,
//         actions: [],
//       ),
//       body: Container(
//         padding: EdgeInsets.all(15),
//         alignment: Alignment.center,
//         child: GridView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200,
//                 childAspectRatio: 3 / 2.4,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20),
//             itemCount: cropsAll.length,
//             itemBuilder: (BuildContext ctx, index) {
//               // isCardEnabled.add(false);
//               return GestureDetector(
//                 onTap: () {
//                   // clickVisibleInvisible();
//
//                   setState(() {
//                     // isCardEnabled.replaceRange(0, isCardEnabled.length, [
//                     //   for (int i = 0; i < isCardEnabled.length; i++) false
//                     // ]);
//                     // isCardEnabled[index] = true;
//                     //
//                     // title = fields[index].fieldName;
//                   });
//                 },
//                 child: Container(
//                   // margin: EdgeInsets.all(8),
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     // color: style.inputFieldColor,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         // color: isCardEnabled[index] == true
//                         //     ? style.accentColor.withOpacity(0.50)
//                         //     : style.accentColor.withOpacity(0.0),
//                         spreadRadius: 5,
//                         blurRadius: 15,
//                         offset: Offset(0, 0), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         cropsAll[index].cropsName,
//                         style: TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.w600),
//                       ),
//                       Text(
//                         cropsAll[index].cropsCountry,
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: style.subtitleCard),
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             cropsAll[index].toString() + ' °C',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                                 color: style.subtitleCard),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Icon(
//                             Icons.sunny,
//                             color: style.subtitleCard,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 12,
//                       ),
//                       Text(
//                         cropsAll[index].cropSystem,
//                         style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
//
//   AppBar buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.lightBlueAccent,
//       title: Text('dmvidfmv'),
//       centerTitle: true,
//       actions: [
//         DropdownButton<String>(
//           value: dropdownValue,
//           // icon: const Icon(Icons.arrow_downward),
//           elevation: 16,
//           style: const TextStyle(color: Colors.deepPurple),
//           onChanged: (String? value) {
//             // This is called when the user selects an item.
//             setState(() {
//               dropdownValue = value!;
//
//               if (dropdownValue == "Eng") {
//                 widget.setLocale(const Locale.fromSubtags(languageCode: 'en'));
//               } else if (dropdownValue == "It") {
//                 widget.setLocale(const Locale.fromSubtags(languageCode: 'it'));
//               }
//
//               // print(dropdownValue = 'En');
//             });
//           },
//           items: LanguageItems.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
