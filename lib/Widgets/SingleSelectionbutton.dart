// import 'package:flutter/material.dart';
//
// import 'package:flutter/material.dart';
//
// const List<Widget> DataButton = <Widget>[
//   Card(margin: EdgeInsets.all(20), child: Text('data')),
//   Card(margin: EdgeInsets.all(20), child: Text('data')),
//   Card(margin: EdgeInsets.all(20), child: Text('data'))
// ];

// class ToggleButtonsSample extends StatefulWidget {
//   const ToggleButtonsSample({
//     super.key,
//   });
//
//   @override
//   State<ToggleButtonsSample> createState() => _ToggleButtonsSampleState();
// }
//
// class _ToggleButtonsSampleState extends State<ToggleButtonsSample> {
//   final List<bool> _selectedDataButton = <bool>[true, false, false];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Card(
//         margin: EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // ToggleButtons with a single selection.
//               // Text('Single-select', style: theme.textTheme.subtitle2),
//
//               ToggleButtons(
//                 // direction: vertical ? Axis.vertical : Axis.horizontal,
//                 onPressed: (int index) {
//                   setState(() {
//                     // The button that is tapped is set to true, and the others to false.
//                     for (int i = 0; i < _selectedDataButton.length; i++) {
//                       _selectedDataButton[i] = i == index;
//                     }
//                   });
//                 },
//
//                 isSelected: _selectedDataButton,
//                 children: DataButton,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// radio Button

//
// class SingleSelectionButton extends StatefulWidget {
//   SingleSelectionButton(this.sortFilter);
//   List<String> sortFilter;
//
//   @override
//   State<SingleSelectionButton> createState() => _SingleSelectionButtonState();
// }
//
// class _SingleSelectionButtonState extends State<SingleSelectionButton> {
//   String? selectValue;
//
//   @override
//   void initState() {
//     super.initState();
//     selectValue = widget.sortFilter.first;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (ctx, index) {
//         return Container(
//           child: Row(
//             children: [
//               Card(
//                 child: TextButton(
//                     onPressed: () {}, child: Text(widget.sortFilter[index])),
//               )
//             ],
//           ),
//         );
//       },
//       itemCount: widget.sortFilter.length,
//     );
//   }
// }

// Radio(
//   value: widget.sortFilter[index],
//   groupValue: selectValue,
//   onChanged: (s) {
//     selectValue = s;
//     setState(() {});
//   },
// ),
