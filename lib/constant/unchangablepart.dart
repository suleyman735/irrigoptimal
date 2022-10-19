import 'package:flutter/material.dart';

const List<String> LanguageItems = <String>['Eng', 'It'];
String dropdownValue = LanguageItems.first;

class BuildAppBArSection extends StatefulWidget {
  BuildAppBArSection(this.setLocale, {super.key});
  final void Function(Locale locale) setLocale;

  @override
  State<BuildAppBArSection> createState() => _BuildAppBArSectionState();
}

class _BuildAppBArSectionState extends State<BuildAppBArSection> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.lightBlueAccent,
      title: Text('_text.toString()'),
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
}
