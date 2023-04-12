import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/Activity/location.dart';
import 'package:weatherapp_starter_project/api/api_calling.dart';
import 'dart:convert';

import 'package:flutter_spinkit/flutter_spinkit.dart';

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

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "temp_value": temp,
      "hum_value": humidity,
      "des_value": description,
      "air_speed_value": air_speed,
      "main_value": main
    });
  }

  @override
  void initState() {
    super.initState();
    startApp();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 95, 74, 145),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 65,
                foregroundImage: AssetImage(
                  'assets/weather/11d.png',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                ' Loading....\nWeather Data',
                style: TextStyle(fontSize: 30, color: Colors.amber),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Made by Nofal',
                style: TextStyle(color: Colors.amber),
              ),
              SizedBox(
                height: 20,
              ),
              SpinKitWave(
                color: Colors.white,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
