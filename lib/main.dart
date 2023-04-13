import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/Activity/home.dart';
import 'package:http/http.dart' as http;

import 'package:weatherapp_starter_project/Activity/loading.dart';
import 'package:weatherapp_starter_project/api/api_calling.dart';
import 'package:weatherapp_starter_project/Activity/getting_started.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
    },
  ));
}
