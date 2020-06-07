import 'package:fitervari/views/landing_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static const mainColorCode = 0xFF170D3D;

  Map<int, Color> mainColor =
  {
    50:Color.fromRGBO(23,13,61, .1),
    100:Color.fromRGBO(23,13,61, .2),
    200:Color.fromRGBO(23,13,61, .3),
    300:Color.fromRGBO(23,13,61, .4),
    400:Color.fromRGBO(23,13,61, .5),
    500:Color.fromRGBO(23,13,61, .6),
    600:Color.fromRGBO(23,13,61, .7),
    700:Color.fromRGBO(23,13,61, .8),
    800:Color.fromRGBO(23,13,61, .9),
    900:Color.fromRGBO(23,13,61, 1),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitervari',
      theme: ThemeData(
        primarySwatch: MaterialColor(mainColorCode, mainColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(),
    );
  }
}
