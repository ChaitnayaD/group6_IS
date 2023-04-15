import 'package:flutter/material.dart';
import 'package:himanshuproject/line-chart2.dart';

import 'line-chart.dart';
import 'drop1.dart';
import 'drop2.dart';

// void main() => runApp(MyApp());
String drop='2';
class MyAnalysis extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Different  Properties'),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key = const Key("any_key"), required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      // backgroundColor: Colors.lightBlue,
      //title: Text(title),
      //),
      backgroundColor: Colors.white,
      body: ListView( padding: const EdgeInsets.all(15),
          children: <Widget>[
            Text(selectionColor: Colors.black,textAlign: TextAlign.center,"Select Property"),
            // StockChartExample(),
            DropdownButtonExample1(),
            Text(selectionColor: Colors.black,textAlign: TextAlign.center,"Select Timeline"),
            DropdownButtonExample2(),
            // Text(selectionColor: Colors.black,textAlign: TextAlign.center,"jjj"),
            SizedBox(height: 20),
            if(dropdownValue1 == 'S1temperature')
              StockChartExample2(),





          ],


      ),
    );
  }
}

