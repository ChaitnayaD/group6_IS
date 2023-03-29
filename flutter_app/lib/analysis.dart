import 'package:flutter/material.dart';

import 'line-chart.dart';


// void main() => runApp(MyApp());
const List<String> list = <String>['S1temperature', 'S1humidity', 'ethyleneppm1', 'ethyleneppm2','co2ppm'];
class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      // icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      alignment: Alignment.center,
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
          alignment: Alignment.center,
        );
      }).toList(),
    );
  }
}








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
          children:const <Widget>[
            Text(selectionColor: Colors.black,textAlign: TextAlign.center,"Select Property"),
            // StockChartExample(),
            DropdownButtonExample(),
            Text(selectionColor: Colors.black,textAlign: TextAlign.center,"Select Node"),
            DropdownButtonExample(),
            // Text(selectionColor: Colors.black,textAlign: TextAlign.center,"jjj"),
             StockChartExample(),

          ]


      ),
    );
  }
}

