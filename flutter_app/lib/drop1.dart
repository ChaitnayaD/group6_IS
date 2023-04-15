import 'package:flutter/material.dart';

import 'line-chart.dart';


// void main() => runApp(MyApp());
const List<String> list = <String>['S1temperature', 'S1humidity', 'ethyleneppm1', 'ethyleneppm2','co2ppm'];
class DropdownButtonExample1 extends StatefulWidget {
  const DropdownButtonExample1({super.key});

  @override
  State<DropdownButtonExample1> createState() => _DropdownButtonExampleState();
}
String dropdownValue1 = list.first;
class _DropdownButtonExampleState extends State<DropdownButtonExample1> {


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue1,
      // icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      alignment: Alignment.center,
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue1 = value!;
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









