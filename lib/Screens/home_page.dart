import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const List<String> LanguageItems = <String>['Eng', 'It'];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,

        title: const Text('IRRIGATION'),
        centerTitle: true,
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
      ),
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
