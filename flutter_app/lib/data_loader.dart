import 'dart:async';
import 'dart:convert' show jsonDecode;
import 'package:flutter/services.dart' show rootBundle;

import 'datum.dart';

Future<List<Datum>> loadStockData() async {
  final String fileContent = await rootBundle.loadString('assets/data.json');
  final List<dynamic> data = jsonDecode(fileContent);
  return data.map((json) => Datum.fromJson(json)).toList();
}
Future<List<Datum2>> loadStockData2() async {
  final String fileContent = await rootBundle.loadString('assets/data.json');
  final List<dynamic> data = jsonDecode(fileContent);
  return data.map((json) => Datum2.fromJson(json)).toList();
}
Future<List<Datum3>> loadStockData3() async {
  final String fileContent = await rootBundle.loadString('assets/data.json');
  final List<dynamic> data = jsonDecode(fileContent);
  return data.map((json) => Datum3.fromJson(json)).toList();
}