import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/Activity/location.dart';
import 'package:weatherapp_starter_project/api/api_calling.dart';
import 'dart:convert';

import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var x;
  void startApp() async {
    worker instance = worker(location: 'Sydney');
    await instance.getData();
    print(instance.air_speed);
    print(instance.description);
    print(instance.humidity);
    print(instance.main);
    print(instance.temp);
    x = await instance.air_speed;
  }

  @override
  void initState() {
    super.initState();
    startApp();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        '$x',
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
