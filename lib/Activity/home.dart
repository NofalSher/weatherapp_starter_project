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
        'https://api.openweathermap.org/data/3.0/onecall?lat=33.6844&lon=73.0479&appid=c72003fb0ae9a2d22008765f590e802e&exclude=minutely&units=metric');
    Response response = await get(res);
    print(response.body);
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
