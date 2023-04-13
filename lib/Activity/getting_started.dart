import 'package:flutter/material.dart';

class getting_Started extends StatelessWidget {
  const getting_Started({super.key});

  @override
  Widget build(BuildContext context) {
    double Screen_Width = MediaQuery.of(context).size.width;
    double Screen_Height = MediaQuery.of(context).size.height;
    double radius_image = (Screen_Height * .8 >= Screen_Width)
        ? Screen_Height * .2
        : Screen_Width * .3;
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
              top: Screen_Height * .1,
              bottom: Screen_Height * .02,
              left: Screen_Width * .05,
              right: Screen_Width * .05),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: radius_image,
                foregroundImage: AssetImage(
                  'assets/weather/11d.png',
                ),
              ),
              SizedBox(
                height: Screen_Height * .05,
              ),
              Text(
                'Discover the Weather\nin Your City',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Screen_Height * .03, color: Colors.white),
              ),
              SizedBox(
                height: Screen_Height * .03,
              ),
              Text(
                'Get to know your weather maps and\nradar percpitation forecast',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: Screen_Height * .02),
              ),
              Padding(
                padding: EdgeInsets.all(Screen_Height * .05),
                child: InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: Screen_Height * .1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/loading');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
