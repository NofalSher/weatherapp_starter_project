import 'package:http/http.dart';
import 'dart:convert';

class api_calling {
  String location;
  String get_temp;
  String get_humidity;
  String get_pressure;
  String get_air_speed;
  String get_weather_condition;
  String main;

  api_calling({this.location}) {}

  void getData() async {
    var res = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c72003fb0ae9a2d22008765f590e802e');
    var response = await get(res);
    Map data = jsonDecode(response.body);
    List weather_data = data['weather'];
    Map weather_main_data = weather_data[0];
    print(weather_data);
    print(weather_main_data['main']);

    Map wind = data['wind'];
    double air_speed = wind['speed'];

    Map temp_data = data['main'];

    double humindity = temp_data['humindity'];

    double temp = temp_data['temp'];
    print(temp);

    String weather_condition = weather_main_data['description'];
    String main = weather_main_data['main'];
  }
}
