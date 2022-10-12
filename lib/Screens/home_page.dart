import 'package:flutter/material.dart';
import 'package:irrigoptimal/Screens/login.dart';
import 'generalhome_page.dart';
import '../Widgets/globalVer.dart';

import 'irrig_start.dart';
import 'irrig_stop.dart';

// class GlobalVer {
//  static bool set _enabled => false;
// }

class HomePage extends StatefulWidget {
  final String fieldName;
  final bool activeColour;
  final bool onPress;
  late bool active;
  bool enabled = true;
  bool inActive = false;
  HomePage({
    Key? key,
    required this.fieldName,
    required this.activeColour,
    required this.onPress,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _currentIndex = 0;
  // final List _pageOptions = [
  //   const GeneralHomePage(),
  //   const StartIrrig(),
  //   const IrrigStop(),
  // ];

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  callBack(enabledTrue) {
    setState(() {
      widget.enabled = enabledTrue;
    });
  }

  bool checkScreenOneValue = true;

  testFunction(bool checkValue) {
    checkScreenOneValue = checkValue;
    print("****TestFunction $checkScreenOneValue");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        top: true,
        child: Scaffold(
          extendBody: true,
          key: _drawerKey,
          appBar: buildAppBar(),
          body: Stack(
            children: <Widget>[
              Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image:
                      AssetImage('../img/PNG_transparency_demonstration_1.png'),
                  fit: BoxFit.fitWidth,
                )

                    // color: Colors.green,
                    ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Smart Irrigation",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "This is Smart Irrigation plant",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          width: 200, // it just take 60% of total width
                          child: Text(
                            "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
                          ),
                        ),
                        const SizedBox(
                          height: 100, // it just take the 50% width
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 20,
                              width: 60,
                              color: Colors.green,
                              child: const Text('active'),
                            ),
                            Container(
                              height: 20,
                              width: 60,
                              color: Colors.yellow,
                              child: const Text('inactive'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(spacing: 20, runSpacing: 20, children: [
                          // FieldCard(
                          //   fieldName: 'Field 1',
                          //   activeColour: true,
                          //   onPress: true,
                          //   active: false,
                          // ),
                          Container(
                            height: 65,
                            width: double.infinity,
                            color: Colors.red,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        widget.activeColour
                                            ? Colors.green
                                            : Colors.yellow),
                              ),
                              onPressed: () {
                                if (widget.onPress) {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => const StartIrrig()),
                                  // );
                                  setState(() {
                                    widget.active = !widget.active;
                                    widget.enabled = true;

                                    print(widget.inActive);
                                  });
                                } else {
                                  print('null');
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(
                                  //   testFunction:testFucntion,
                                  // )))
                                  // Scaffold.of(context)
                                  //     .widget
                                  //     .bottomNavigationBar;

                                  null;
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Text(widget.fieldName),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),
                        // FieldCard(fieldName: '', activeColour: null,);
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          drawer: buildDrawer(),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    print('button tapped');
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                Visibility(
                  visible: true,
                  child: IconButton(
                    onPressed: () {
                      print('button tapped');
                    },
                    icon: const Icon(
                      Icons.start_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: IconButton(
                    onPressed: widget.onPress ? () {} : null,
                    icon: const Icon(
                      Icons.stop_circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Drawer buildDrawer() {
    return Drawer(
        child: ListView(
      children: [
        ListTile(
          title: const Text('Home'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Actuator'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Plovium'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Field'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Support'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        )
      ],
    ));
  }

  // BottomNavigationBar buildBottomNavigationBar() {
  //   bool inActive = true;
  //   return BottomNavigationBar(
  //     currentIndex: _currentIndex,
  //     type: BottomNavigationBarType.fixed,
  //     items: const <BottomNavigationBarItem>[
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.home_filled),
  //         label: 'Home',
  //         backgroundColor: Colors.lightBlueAccent,
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.start_outlined),
  //         label: 'IR NOW',
  //         backgroundColor: Colors.green,
  //         // activeIcon:
  //         //     inActive ? Icon(Icons.abc_rounded) : Icon(Icons.access_alarm),
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.stop_circle),
  //         label: 'STOP',
  //         backgroundColor: Colors.red,
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.more_horiz),
  //         label: 'MORE',
  //         backgroundColor: Colors.lightBlueAccent,
  //       ),
  //     ],
  //     onTap: (index) {
  //       if (index == 3) {
  //         _drawerKey.currentState?.openDrawer();
  //       } else {
  //         setState(() {
  //           _currentIndex = index;
  //         });
  //       }
  //     },
  //   );
  // }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.lightBlueAccent,
      leading: const Icon(Icons.account_circle_rounded),
      title: const Text('IRRIGATION'),
      centerTitle: true,
      actions: const [Icon(Icons.notifications)],
    );
  }
}

// class GeneralHomePage extends StatelessWidget {
//   const GeneralHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: 350,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//               image: AssetImage('../img/PNG_transparency_demonstration_1.png'),
//               fit: BoxFit.fitWidth,
//             )
//
//                 // color: Colors.green,
//                 ),
//           ),
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: size.height * 0.05,
//                     ),
//                     Text(
//                       "Smart Irrigation",
//                       style: Theme.of(context)
//                           .textTheme
//                           .displayMedium
//                           ?.copyWith(fontWeight: FontWeight.w400),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       "This is Smart Irrigation plant",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 10),
//                     const SizedBox(
//                       width: 200, // it just take 60% of total width
//                       child: Text(
//                         "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 100, // it just take the 50% width
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: 20,
//                           width: 60,
//                           color: Colors.green,
//                           child: const Text('active'),
//                         ),
//                         Container(
//                           height: 20,
//                           width: 60,
//                           color: Colors.yellow,
//                           child: const Text('inactive'),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Wrap(spacing: 20, runSpacing: 20, children: [
//                       FieldCard(
//                         fieldName: 'Field 1',
//                         activeColour: true,
//                         onPress: true,
//                         active: false,
//                       ),
//                     ]),
//                     // FieldCard(fieldName: '', activeColour: null,);
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class FieldCard extends StatefulWidget {
  final String fieldName;
  final bool activeColour;
  final bool onPress;
  late bool active;
  FieldCard(
      {super.key,
      required this.fieldName,
      required this.activeColour,
      required this.onPress,
      required this.active});

  @override
  State<FieldCard> createState() => _FieldCardState();
}

class _FieldCardState extends State<FieldCard> {
  @override
  Widget build(BuildContext context) {
    bool _enabled = false;
    var _onPressed;
    if (_enabled) {
      _onPressed = () {
        print('tap');
      };
    }
    return Column(
      children: [
        Container(
          height: 65,
          width: double.infinity,
          color: Colors.red,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    widget.activeColour ? Colors.green : Colors.yellow)),
            onPressed: () {
              if (widget.onPress) {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const StartIrrig()),
                // );
                setState(() {
                  widget.active = !widget.active;
                  _enabled = true;
                  print(widget.active);
                });
              } else {
                null;
              }
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [Text(widget.fieldName)],
              ),
            ),
          ),
        ),
        Visibility(
          visible: _enabled,
          child: Column(
            children: [
              //   ListTile(
              //     title: new ElevatedButton(
              //         onPressed: _onPressed, child: Text('Irr Now')),
              //   ),
              //   ListTile(
              //     title: new ElevatedButton(
              //         onPressed: _onPressed, child: Text('Stop')),
              //   ),
            ],
          ),
        ),
      ],
    );
  }
}
