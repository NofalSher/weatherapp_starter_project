// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart';

class worker {
  String location;
  worker({required this.location}) {
    location = this.location;
  }

  String? temp;
  String? humidity;
  String? air_speed;

  String? description;
  String? main;

  Future<void> getData() async {
    var res = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c72003fb0ae9a2d22008765f590e802e');
    var response = await get(res);
    Map data = jsonDecode(response.body);

    List get_weather_data = data['weather'];
    Map get_weather_main_data = get_weather_data[0];

    String get_main_desc = get_weather_main_data['main'];
    String get_desc = get_weather_main_data['description'];

    Map get_temp_data = data['main'];
    double get_temp = get_temp_data['temp'];

    Map get_wind = data['wind'];
    double get_air_speed = get_wind['speed'];

    double get_humidity = get_temp_data['humidity'];

    temp = get_temp.toString();
    humidity = get_humidity.toString();
    air_speed = get_air_speed.toString();
    description = get_desc;
    main = get_main_desc;
  }
}
