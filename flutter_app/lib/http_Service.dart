import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:himanshuproject/dashboard.dart';
import 'package:himanshuproject/login.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class HttpService {
  static final _client = http.Client();

  static var _loginUrl = Uri.parse('http://10.0.2.2:5000/login');

  static var _registerUrl = Uri.parse('http://10.0.2.2:5000/register');

  static login(email, password, context) async {
    http.Response response = await _client.post(_loginUrl, body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var json = jsonDecode(response.body);

      if (json[0] == "success") {
        await EasyLoading.showSuccess(json[0]);
       await Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyDashboard()));
      } else {
        EasyLoading.showError(json[0]);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static register(username, email, password, context) async {
    http.Response response = await _client.post(_registerUrl, body: {
      'username': username,
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json[0] == "Account already exists") {
        await EasyLoading.showError(json[0]);
      } else if (json[0] == "Registered"){
        await EasyLoading.showSuccess(json[0]);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MyLogin()));
      }else if (json[0] == "Invalid email address !") {
        await EasyLoading.showError(json[0]);
      }
      else if (json[0] == "Please fill out the form !") {
        await EasyLoading.showError(json[0]);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}