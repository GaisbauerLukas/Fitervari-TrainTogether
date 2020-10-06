import 'package:fitervari/views/filler_page/filler_page.dart';
import 'package:fitervari/views/news_letter_details_page/NewsLetterDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './views/tabs_screen/tabs_screen.dart';
import './logic/providers/news_letters_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static const mainColorCode = 0xFF170D3D;

  final Map<int, Color> mainColor = {
    50: Color.fromRGBO(23, 13, 61, .1),
    100: Color.fromRGBO(23, 13, 61, .2),
    200: Color.fromRGBO(23, 13, 61, .3),
    300: Color.fromRGBO(23, 13, 61, .4),
    400: Color.fromRGBO(23, 13, 61, .5),
    500: Color.fromRGBO(23, 13, 61, .6),
    600: Color.fromRGBO(23, 13, 61, .7),
    700: Color.fromRGBO(23, 13, 61, .8),
    800: Color.fromRGBO(23, 13, 61, .9),
    900: Color.fromRGBO(23, 13, 61, 1),
  };

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //dated package work this out sometime later
      builder: (ctx) => NewsLettersProvider(),
      child: MaterialApp(
        title: 'Fitervari',
        theme: ThemeData(
          fontFamily: 'RobotoCondensed',
          textTheme: TextTheme(
            bodyText2: TextStyle(fontWeight: FontWeight.w300),
          ),
          primarySwatch: MaterialColor(mainColorCode, mainColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TabsScreen(),
        routes: {
          FillerPage.routeName: (ctx) => FillerPage(),
          NewsLetterDetailsPage.routeName: (ctx) => NewsLetterDetailsPage(),
        },
      ),
    );
  }
}
