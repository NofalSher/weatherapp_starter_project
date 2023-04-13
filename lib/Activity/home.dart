import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool _iconBool = false;
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? info =
        (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>);
    print(info);
    // ignore: unused_local_variable

    double Screen_Width = MediaQuery.of(context).size.width;
    double Screen_Height = MediaQuery.of(context).size.height;

    var date = DateTime.now();
    String date1 =
        date.toString(); // prints something like 2019-12-10 10:02:22.287949
    String day = DateFormat('EEEE').format(date);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 102, 119, 213),
        body: Padding(
          padding: EdgeInsets.only(
              left: Screen_Width * .04,
              right: Screen_Width * .04,
              top: Screen_Height * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          color: Colors.white,
                          Icons.notes_outlined,
                          size: Screen_Height * .05,
                        ),
                      ),
                      onTap: () {},
                    ),
                    Row(
                      children: [
                        InkWell(
                          child: Icon(
                            color: Colors.blue,
                            Icons.location_on_outlined,
                            size: Screen_Height * .05,
                          ),
                          onTap: () {},
                        ),
                        Text(
                          'hello',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Screen_Height * .04),
                        ),
                        Icon(
                          Icons.expand_more,
                          color: Colors.white,
                          size: Screen_Height * .05,
                        )
                      ],
                    ),
                    InkWell(
                      child: Icon(
                        _iconBool ? _iconDark : _iconLight,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          _iconBool = !_iconBool;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Screen_Height * .03,
              ),
              Text(
                "Today's Report",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Screen_Height * .035,
                ),
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: Screen_Height * .15,
                  foregroundImage: AssetImage(
                    'assets/weather/11d.png',
                  ),
                ),
              ),
              SizedBox(
                height: Screen_Height * .035,
              ),
              Center(
                child: Text(
                  info['des_value'],
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Screen_Height * .03),
                ),
              ),
              SizedBox(
                height: Screen_Height * .02,
              ),
              Center(
                child: Text(
                  info['temp_value'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Screen_Height * .04,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: Screen_Height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: Screen_Height * .045,
                        foregroundImage: AssetImage(
                          'assets/weather/11d.png',
                        ),
                      ),
                      Text(
                        info['air_speed_value'] + 'Km/h',
                        style: TextStyle(fontSize: Screen_Height * .03),
                      ),
                      Text(day),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 10,
                        foregroundImage: AssetImage(
                          'assets/weather/11d.png',
                        ),
                      ),
                      Text(
                        info['air_speed_value'],
                      ),
                      Text(
                        info['air_speed_value'],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 10,
                        foregroundImage: AssetImage(
                          'assets/weather/11d.png',
                        ),
                      ),
                      Text(
                        info['air_speed_value'],
                      ),
                      Text(
                        info['air_speed_value'],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
          child: Container(
            // margin: EdgeInsets.all(10),
            height: Screen_Height * .12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 85, 82, 82),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: Icon(
                    color: Colors.grey,
                    Icons.home,
                    size: 35,
                  ),
                ),
                InkWell(
                  child: Icon(
                    color: Colors.grey,
                    Icons.search,
                    size: 35,
                  ),
                ),
                InkWell(
                  child: Icon(
                    color: Colors.grey,
                    Icons.explore,
                    size: 35,
                  ),
                ),
                InkWell(
                  child: Icon(
                    color: Colors.grey,
                    Icons.person_outline,
                    size: 35,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
