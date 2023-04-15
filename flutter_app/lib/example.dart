import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineChartFromJson extends StatefulWidget {
  @override
  _LineChartFromJsonState createState() => _LineChartFromJsonState();
}

class _LineChartFromJsonState extends State<LineChartFromJson> {
  List<charts.Series<LinearSales, int>> _seriesLineData;

  _generateData() async {
    String data =
    await DefaultAssetBundle.of(context).loadString("assets/data.json");
    final jsonResult = json.decode(data);
    List<LinearSales> salesData = [];
    for (var i = 0; i < jsonResult.length; i++) {
      salesData.add(LinearSales.fromJson(jsonResult[i]));
    }
    setState(() {
      _seriesLineData.add(
        charts.Series(
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          id: 'Sales',
          data: salesData,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _seriesLineData = List<charts.Series<LinearSales, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Chart From Json'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Sales Data'),
              Expanded(
                child: charts.LineChart(_seriesLineData,
                    defaultRenderer:
                    new charts.LineRendererConfig(includePoints: true),
                    animate: true,
                    animationDuration: Duration(seconds: 2),
                    behaviors: [
                      new charts.ChartTitle('Year',
                          behaviorPosition:
                          charts.BehaviorPosition.bottom,
                          titleOutsideJustification:
                          charts.OutsideJustification.middleDrawArea),
                      new charts.ChartTitle('Sales',
                          behaviorPosition:
                          charts.BehaviorPosition.start,
                          titleOutsideJustification:
                          charts.OutsideJustification.middleDrawArea),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);

  factory LinearSales.fromJson(Map<String, dynamic> json) {
    return LinearSales(json['year'], json['sales']);
  }
}
```
This example reads data from a json file named `data.json` in the assets folder. The contents of the file should look like this:
```json
[
{"year":0,"sales":5},
{"year":1,"sales":25},
{"year":2,"sales":100},
{"year":3,"sales":75}
]
```
I hope this helps!