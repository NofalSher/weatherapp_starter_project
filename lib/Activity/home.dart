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
    Object? info = ModalRoute.of(context)!.settings.arguments;
    // ignore: unused_local_variable

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 25, 49),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 243, 166, 33),
                    Color.fromARGB(255, 32, 25, 49),
                  ],
                )),
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 65,
                  foregroundImage: AssetImage(
                    'assets/weather/11d.png',
                  ),
                ),
              ),
              Text(info.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
