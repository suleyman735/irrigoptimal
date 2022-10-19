import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../main.dart';

class IrrigationPage extends StatefulWidget {
  String fieldName;
  IrrigationPage(this.fieldName);
  @override
  State<IrrigationPage> createState() => _IrrigationPageState();
}

class _IrrigationPageState extends State<IrrigationPage> {
  bool isToggled = false;
  bool auto = true;
  bool valveOpen = false;
  String mins = '';
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: style.backgroundColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black, size: 35),
      title: Text(
          style: TextStyle(color: style.accentColor), '${widget.fieldName}'),
    );

    final mediaquery = MediaQuery.of(context);
    style.deviceWidth = mediaquery.size.width;
    style.deviceHeight = mediaquery.size.height -
        mediaquery.padding.top -
        appBar.preferredSize.height;

    showDataAlert() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20.0,
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.all(20),
              // title: const Center(
              //   child: Text(
              //     "Choose time",
              //     style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
              //   ),
              // ),
              content: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Choose time",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        onChanged: (text) {
                          mins = text;
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            hintText: 'Enter mins here',
                            labelText: 'mins'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 80,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!mins.isEmpty) {
                            Navigator.of(context).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: style.accentColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                        child: const Text(
                          "Start irrigation",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: style.backgroundColor,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //title
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Irrigation',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: style.getTextSize(style.textScale, 30.0 + 15),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: ((style.deviceWidth) / 2) -
                            30, //30 is the padding (15 + 15)
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              auto = true;
                            });
                          },
                          child: Text(
                            'Auto',
                            style: TextStyle(
                                fontSize:
                                    style.getTextSize(style.textScale, 5 + 15),
                                fontWeight: FontWeight.w600),
                          ),
                          style: auto
                              ? ElevatedButton.styleFrom(
                                  primary: style.accentColor,
                                  onPrimary: Colors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(18),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                )
                              : ElevatedButton.styleFrom(
                                  primary: style.inputFieldColor,
                                  onPrimary: Colors.black,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(18),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: ((style.deviceWidth) / 2) -
                            30, //30 is the padding (15 + 15)
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              auto = false;
                            });
                          },
                          child: Text('Manual',
                              style: TextStyle(
                                  fontSize: style.getTextSize(
                                      style.textScale, 5 + 15),
                                  fontWeight: FontWeight.w600)),
                          style: auto
                              ? ElevatedButton.styleFrom(
                                  primary: style.inputFieldColor,
                                  onPrimary: Colors.black,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(18),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                )
                              : ElevatedButton.styleFrom(
                                  primary: style.accentColor,
                                  onPrimary: Colors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(18),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            //body
            auto == true
                ? Container(
                    //height: style.deviceHeight*(1 - getTitleContainerHeightPercentage()),
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            'Choose the irrigation mode',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  style.getTextSize(style.textScale, 23.0 + 15),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        Row(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Direct',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: style.getTextSize(
                                          style.textScale, 15.0 + 15),
                                      color: style.subtitle,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'Standby',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: style.getTextSize(
                                          style.textScale, 15.0 + 15),
                                      color: style.subtitle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30),
                            Column(
                              children: [
                                FlutterSwitch(
                                  height: 30.0,
                                  width: 60.0,
                                  padding: 7.0,
                                  toggleSize: 15.0,
                                  borderRadius: 20.0,
                                  activeColor: style.accentColor,
                                  value: isToggled = false,
                                  onToggle: (value) {
                                    setState(() {
                                      isToggled = value;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 33,
                                ),
                                FlutterSwitch(
                                  height: 30.0,
                                  width: 60.0,
                                  padding: 7.0,
                                  toggleSize: 15.0,
                                  borderRadius: 20.0,
                                  activeColor: style.accentColor,
                                  value: isToggled = false,
                                  onToggle: (value) {
                                    setState(() {
                                      isToggled = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        )

                        // Row(
                        //   children: [
                        //
                        //     Text(
                        //
                        //       'Direct',
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: style.getTextSize(style.textScale, 20.0+15),
                        //         color: style.subtitle,
                        //       ),
                        //     ),
                        //
                        //     SizedBox(width: 20,),
                        //
                        //     FlutterSwitch(
                        //       height: 30.0,
                        //       width: 60.0,
                        //       padding: 7.0,
                        //       toggleSize: 15.0,
                        //       borderRadius: 20.0,
                        //       activeColor: style.accentColor,
                        //       value: isToggled = false,
                        //       onToggle: (value) {
                        //         setState(() {
                        //           isToggled = value;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 20,),
                        // Row(
                        //   children: [
                        //
                        //     Text(
                        //       'Standby',
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: style.getTextSize(style.textScale, 20.0+15),
                        //         color: style.subtitle,
                        //       ),
                        //     ),
                        //
                        //     SizedBox(width: 20,),
                        //
                        //     FlutterSwitch(
                        //       height: 30.0,
                        //       width: 60.0,
                        //       padding: 7.0,
                        //       toggleSize: 15.0,
                        //       borderRadius: 20.0,
                        //       activeColor: style.accentColor,
                        //       value: isToggled = false,
                        //       onToggle: (value) {
                        //         setState(() {
                        //           isToggled = value;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Row(
                                children: [
                                  Text(
                                    'Valve status: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: style.getTextSize(
                                          style.textScale, 20.0 + 15),
                                    ),
                                  ),
                                  Text(
                                    valveOpen ? 'Open' : 'Closed',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: style.getTextSize(
                                          style.textScale, 20.0 + 15),
                                      color: valveOpen
                                          ? Colors.green
                                          : Colors.redAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100.0,
                            child: ElevatedButton(
                                onPressed: () {
                                  showDataAlert();
                                  mins = '';
                                },
                                child: Text('Open valve',
                                    style: TextStyle(
                                        fontSize: style.getTextSize(
                                            style.textScale, 10 + 15),
                                        fontWeight: FontWeight.w600)),
                                style: ElevatedButton.styleFrom(
                                  primary: style.inputFieldColor,
                                  onPrimary: Colors.black,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(18),
                                  side: BorderSide(
                                      width: 3, color: style.accentColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 100.0,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Close valve',
                                    style: TextStyle(
                                        fontSize: style.getTextSize(
                                            style.textScale, 10 + 15),
                                        fontWeight: FontWeight.w600)),
                                style: ElevatedButton.styleFrom(
                                  primary: style.inputFieldColor,
                                  onPrimary: Colors.black,
                                  elevation: 0,
                                  padding: const EdgeInsets.all(18),
                                  side: const BorderSide(
                                      width: 3, color: Colors.redAccent),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
