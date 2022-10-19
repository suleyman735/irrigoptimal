
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:irrigoptimal/Screens/irrigation_page.dart';
import 'package:irrigoptimal/Screens/login.dart';
import '../constant/field.dart';
import '../main.dart';

const List<String> LanguageItems = <String>['Eng', 'It'];


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

  void goToInfoPage(){
    print('info page');

  }

  void goToStartPage(){
    print('start page');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IrrigationPage(title)),
    );

  }


  List<bool> isCardEnabled = [];
  String title = 'Irrigoptimal';

    Map<IconData, int> navigationButtonAbilitation = {
    Icons.home: 1,
    Icons.info: 0,
    Icons.start:0,
  };

  @override
  Widget build(BuildContext context) {

    final mediaquery = MediaQuery.of(context);

    void clickVisibleInvisible(){

      //print(navigationButtonAbilitation[Icons.start]);

      setState(() {
        if(navigationButtonAbilitation[Icons.info] == 0){
          navigationButtonAbilitation[Icons.info] = 1;
          navigationButtonAbilitation[Icons.start] = 1;

        }

      });



    }

    Widget printIcon(int ab, IconData icon){


      late Function pressFunction;

      if(icon == navigationButtonAbilitation.keys.elementAt(0)){
        pressFunction = goToHomePage;
      }else if(icon == navigationButtonAbilitation.keys.elementAt(1)){
        pressFunction = goToInfoPage;
      }else if(icon == navigationButtonAbilitation.keys.elementAt(2)){
        pressFunction = goToStartPage;
      }


      if(ab == 1){

        return IconButton(onPressed: (){pressFunction();}, icon: Icon(icon),);

      }else{

        return IconButton(color: Colors.black.withOpacity(0.01), onPressed: null, icon: Icon(icon),);

      }

    }

    final appBar = AppBar(

      backgroundColor: style.backgroundColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black, size: 35),

      title: Text(style: TextStyle(color: style.accentColor), title),

      actions: [const LanguageItemsFucntion()],
      // [
      //   PopupMenuButton<MenuItem>(
      //       itemBuilder: (context) =>
      //           [...MenuLanguageItems.itemFirst.map().toList()])
      // ],
      // ),
      // body: Container(
      //   child: Column(
      //     children: [
      //       Text(AppLocalizations.of(context)!.language),
      //     ],
      //   ),
    );

    // if we skip the login page (already logged in), then we have to assign these variables here (homepage)
    style.isLandscape = mediaquery.orientation == Orientation.landscape;
    style.deviceWidth = mediaquery.size.width;
    //the device height changes in the home page, because there is AppBar (we don't have it in login page)
    style.deviceHeight = mediaquery.size.height - mediaquery.padding.top - appBar.preferredSize.height;
    if(style.isLandscape)
      style.textScale = mediaquery.size.width * 0.01;
    else
      style.textScale = mediaquery.size.height * 0.01;


    List<Field> fields = [];
    fields.add(Field('Gozo', 'Malta', 24, 'Potatoes'));
    fields.add(Field('Catania', 'Italy', 22, 'Strawberries'));
    fields.add(Field('Madrid', 'Spain', 25, 'Lemon trees'));

    return Scaffold(
      backgroundColor: style.backgroundColor,
      appBar: appBar,
      drawer: Drawer(
          child: ListView(
        children: [
          const DrawerHeader(child: Center(child: Text('Irri Optimal '))),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      )),
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Container(
                padding: const EdgeInsets.all(15),
                //height: style.deviceHeight*getHeightTitleContainer(),
                      child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        FittedBox(
                          child: Text(
                            'Your fields',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: style.getTextSize(style.textScale, 30.0+15),
                            ),
                          ),
                        ),
                        Text('${fields.length} active fields', style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0x3C000000), fontSize: 16),)
                      ],

                    ),






              ),
              Container(

                padding: const EdgeInsets.all(15),
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

                        onTap: (){


                            clickVisibleInvisible();

                            setState(() {
                              isCardEnabled.replaceRange(0, isCardEnabled.length, [for(int i = 0; i < isCardEnabled.length; i++)false]);
                              isCardEnabled[index]=true;

                              title = fields[index].fieldName;

                            });

                        },

                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: style.inputFieldColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: isCardEnabled[index] == true ? style.accentColor.withOpacity(0.25)! : style.accentColor.withOpacity(0.0),
                                  spreadRadius: 5,
                                  blurRadius: 15,
                                  offset: const Offset(0, 0), // changes position of shadow
                                ),
                              ],

                            ),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                Text(fields[index].fieldName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                                Text(fields[index].cropField, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),),
                                const SizedBox(height: 12,),
                                Text(fields[index].fieldCountry, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: style.subtitleCard),),

                                Row(
                                  children: [

                                    Text(fields[index].temperature.toString()+' °C', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: style.subtitleCard),),
                                    const SizedBox(width: 10,),
                                    Icon(Icons.sunny, color: style.subtitleCard,),
                                  ],
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
      ),


      // bottomNavigationBar: BottomAppBar(
      //     child: Container(
      //
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: navigationButtonAbilitation.entries.map((entry) {
      //
      //             var w = printIcon(entry.value ,entry.key);
      //             return w;
      //           }).toList(),
      //
      //       ),
      //     ),
      // ),

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
}



class LanguageItemsFucntion extends StatefulWidget {
  const LanguageItemsFucntion({super.key});

  @override
  State<LanguageItemsFucntion> createState() => _LanguageItemsFucntionState();
}

class _LanguageItemsFucntionState extends State<LanguageItemsFucntion> {
  String dropdownValue = LanguageItems.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      // icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: LanguageItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
