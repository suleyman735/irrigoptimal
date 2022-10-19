import 'package:flutter/material.dart';
import 'package:irrigoptimal/Screens/home_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../constant/field.dart';

class MyFieldsInfo extends StatefulWidget {
  String fieldName;
  String cropsName;
  double lastIrrigAmount;
  double recemonedAmount;
  MyFieldsInfo(this.fieldName, this.cropsName, this.lastIrrigAmount,
      this.recemonedAmount);
  @override
  State<MyFieldsInfo> createState() => _MyFieldsInfoState();
}

class _MyFieldsInfoState extends State<MyFieldsInfo> {
  String dropdownvalue1 = 'Daily';
  var items = [
    'Daily',
    'Monthly',
  ];
  @override
  Widget build(BuildContext context) {
    // final now = DateTime.now();
    // final berlinWallFell = DateTime.utc(now);
    // print(berlinWallFell.month);
    final List<ChartData> chartData = [
      ChartData(DateTime(1), DateTime(1), widget.lastIrrigAmount / 1),
      ChartData(DateTime(5), DateTime(3), widget.lastIrrigAmount / 5),
      ChartData(DateTime(10), DateTime(5), widget.lastIrrigAmount / 10),
      ChartData(DateTime(15), DateTime(7), widget.lastIrrigAmount / 15),
      ChartData(DateTime(20), DateTime(9), widget.lastIrrigAmount / 20),
      ChartData(DateTime(25), DateTime(11), widget.lastIrrigAmount / 25),
      ChartData(DateTime(30), DateTime(12), widget.lastIrrigAmount / 30),
    ];

    List<Field> fields = [];
    fields.add(Field('Gozo', 'Malta', 24, 'Orange', '24/09/2022 at 20:00',
        widget.cropsName, widget.recemonedAmount, widget.lastIrrigAmount));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(widget.fieldName),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: fields.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 100,
                  color: Color(0x46000000),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                          fields[index].cropsName,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('21  °C',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0x46000000),
                            )),
                        Icon(
                          Icons.sunny,
                          color: Color(0x46000000),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('Next irrigation : '),
                        Text('24/10/2022 at 19:00')
                      ],
                    ),
                  ]),
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0x46000000),
                        ),
                        margin: EdgeInsets.all(20),
                        height: 110,
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                              'LAst Irrigation Amount',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              fields[index].fieldsLastIrrigAmount.toString(),
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0x46000000),
                        ),
                        margin: EdgeInsets.all(20),
                        height: 110,
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                              'Recemended Irrigation',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              fields[index].fieldsRecemonedAmount.toString(),
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                          ],
                        )),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: DropdownButton(
                          value: dropdownvalue1,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue1 = newValue!;
                              print(dropdownvalue1);
                            });
                          }),
                    ),
                    Container(
                      height: 250,
                      width: double.infinity,
                      // color: Colors.red,
                      child: SfCartesianChart(
                        primaryXAxis: DateTimeAxis(),
                        series: <ChartSeries>[
                          // Renders line chart
                          LineSeries<ChartData, DateTime>(
                              dataSource: chartData,
                              xValueMapper: (ChartData sales, _) =>
                                  dropdownvalue1 == 'Monthly'
                                      ? sales.monthly
                                      : sales.daily,
                              yValueMapper: (ChartData sales, _) => sales.sales)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
