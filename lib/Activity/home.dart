import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getData() async {
    var res = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=islamabad&appid=c72003fb0ae9a2d22008765f590e802e');
    var response = await get(res);
    Map data = jsonDecode(response.body);
    print(data['current']);
    print('___________________________________________ ');
    List hourly = data['daily'];
    print(hourly[4]['temp']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 25, 49),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  'assets/weather/11d.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
