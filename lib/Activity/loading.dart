import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/api/api_calling.dart';
import 'dart:convert';

import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? location = 'Islamabad';
  var x;
  void startApp() async {
    api_Calling instance = api_Calling(location: 'Islamabad');
    await instance.getData();
    print(instance.air_speed);
  }

  Future<void> getData() async {
    var res = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c72003fb0ae9a2d22008765f590e802e');
    var response = await get(res);
    Map data = jsonDecode(response.body);
    List get_weather_data = data['weather'];
    Map get_weather_main_data = get_weather_data[0];
    print(get_weather_data);
    print('_________________________________________');
    print(get_weather_main_data);
  }

  @override
  void initState() {
    super.initState();
    getData();
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
