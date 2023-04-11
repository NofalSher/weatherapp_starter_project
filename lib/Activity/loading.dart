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
  String? temp;
  String? humidity;
  String? air_speed;

  String? description;
  String? main;

  void startApp() async {
    worker instance = worker(location: 'Lahore');
    await instance.getData();
    temp = instance.temp;
    humidity = instance.humidity;
    air_speed = instance.air_speed;
    description = instance.description;
    main = instance.main;

    //    Sending data to the home page

    // Navigator.pushReplacementNamed(context, '/home', arguments: {
    //   "temp_value": temp,
    //   "hum_value": humidity,
    //   "des_value": description,
    //   "air_speed_value": air_speed,
    //   "main_value": main
    // });
  }

  @override
  void initState() {
    super.initState();
    startApp();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Loading Weather Data',
            style: TextStyle(color: Colors.amber),
          ),
          Text(
            'Made by Nofal',
            style: TextStyle(color: Colors.amber),
          ),
        ],
      ),
    );
  }
}
