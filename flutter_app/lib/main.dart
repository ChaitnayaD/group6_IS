import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'register.dart';
import 'dashboard.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyDashboard(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
       'home': (context) => MyHome(),
      'dashboard':(context)=>MyDashboard(),
    },
    builder: EasyLoading.init(),
  ));
}
