// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart';

class api_Calling {
  String location;

  api_Calling({
    required this.location,
  }) {
    location = this.location;
  }
  String? get_weather_condition;
  String? get_Main;

  String? temp;
  String? humidity;
  String? air_speed;

  String? weather_condition;
  String? main;

  Future<void> getData() async {
    var res = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c72003fb0ae9a2d22008765f590e802e');
    var response = await get(res);
    Map data = jsonDecode(response.body);
    List get_weather_data = data['weather'];
    Map get_weather_main_data = get_weather_data[0];
    print(get_weather_data);
    print(get_weather_main_data['main']);

    Map get_wind = data['wind'];
    double get_air_speed = get_wind['speed'];

    Map temp_data = data['main'];

    double get_humindity = temp_data['humindity'];

    double get_temp = temp_data['temp'];

    get_weather_condition = get_weather_main_data['description'];
    get_Main = get_weather_main_data['main'];

    temp = get_temp.toString();
    humidity = get_humindity.toString();
    air_speed = get_air_speed.toString();

    weather_condition = get_weather_condition.toString();
    main = get_Main.toString();
  }
}
