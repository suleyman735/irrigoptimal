import 'package:flutter/material.dart';
import 'package:irrigoptimal/Screens/home_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../constant/field.dart';
import '../main.dart';

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

    final mediaquery = MediaQuery.of(context);
    style.isLandscape = mediaquery.orientation == Orientation.landscape;
    style.deviceWidth = mediaquery.size.width;

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

      backgroundColor: style.backgroundColor,

      appBar: AppBar(
        backgroundColor: style.backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black, size: 35),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(widget.fieldName, style: TextStyle(color: style.accentColor, fontSize: 22),),
        centerTitle: true,
      ),
      body: Container(
        
        padding: EdgeInsets.all(15),
        
        child: ListView.builder(
          itemCount: fields.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  //margin: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: style.inputFieldColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                          fields[index].cropsName,
                        ),
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      children: [
                        Text('21 °C',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: style.subtitleCard,
                            )),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.sunny,
                          color: style.subtitleCard,
                        )
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      children: [
                        Text('Next irrigation : ',style: TextStyle(fontWeight: FontWeight.w400),),
                        Text('24/10/2022 at 19:00', style: TextStyle(fontWeight: FontWeight.w600),)
                      ],
                    ),
                  ]),
                ),

                SizedBox(height: 20,),

                Container(

                  width: double.infinity,
                  //color: Colors.red,

                  child: Row(

                    mainAxisAlignment: style.isLandscape ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,

                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: style.inputFieldColor,

                        ),
                        width: style.isLandscape ? style.deviceHeight/2 - 30 : style.deviceWidth/2 - 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('Last irrigation amount', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                            SizedBox(height: 20,),
                            Text('${fields[index].fieldsLastIrrigAmount.toString()}L', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: style.accentColor),),

                          ],

                        ),

                      ),

                      if(style.isLandscape) SizedBox(width: 30,)
                      else Container(),

                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: style.inputFieldColor,

                        ),
                        width: style.isLandscape ? style.deviceHeight/2 - 30 : style.deviceWidth/2 - 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('Next irrigation amount', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                            SizedBox(height: 20,),
                            Text('${fields[index].fieldsRecemonedAmount.toString()}L', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: style.accentColor),),

                          ],

                        ),

                      ),
                    ],

                  ),

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
                      height: 240,
                      width: double.infinity,
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


