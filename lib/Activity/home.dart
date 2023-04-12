import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

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

  @override
  Widget build(BuildContext context) {
    Object? info = ModalRoute.of(context)?.settings.arguments;

    // ignore: unused_local_variable

    return Scaffold(
      appBar: AppBar(),
      body: const CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 65,
        foregroundImage: AssetImage(
          'assets/weather/11d.png',
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          margin: EdgeInsets.all(10),
          height: 100,
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
                  Icons.home,
                  size: 35,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.search,
                  size: 35,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.explore,
                  size: 35,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.account_box_rounded,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
