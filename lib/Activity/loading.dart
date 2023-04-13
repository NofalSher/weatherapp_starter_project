import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/api/api_calling.dart';
import 'dart:convert';
import 'package:weatherapp_starter_project/Activity/getting_started.dart';

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
    worker instance = worker(location: 'Sydney');
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
    double Screen_Width = MediaQuery.of(context).size.width;
    double Screen_Height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 95, 74, 145),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
              top: Screen_Height * .2, bottom: Screen_Height * .05),
          child: Column(
            children: [
              // ),
              Container(
                height: Screen_Height * .3,
                width: Screen_Width * .5,
                child: Image.asset(
                  'assets/image/getting_Started_Page_image.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: Screen_Height * .05,
              ),
              Text(
                ' Loading....\nWeather Data',
                style: TextStyle(
                    fontSize: Screen_Height * .04, color: Colors.amber),
              ),
              SizedBox(
                height: Screen_Height * .05,
              ),
              Text(
                'Made by Nofal',
                style: TextStyle(color: Colors.amber),
              ),
              SizedBox(
                height: Screen_Height * .05,
              ),
              SpinKitWave(
                color: Colors.white,
                size: Screen_Height * .07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
