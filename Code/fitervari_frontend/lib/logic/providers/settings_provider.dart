
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {

  static const _mainColorCode = 0xFF170D3D;

  static Map<int, Color> _mainColor = {
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

  ThemeData _currentTheme;

  ThemeData get currentTheme {
    return _currentTheme;
  }

  void setLightTheme() {
    _currentTheme = ThemeData(
      fontFamily: 'RobotoCondensed',
      textTheme: TextTheme(
        headline5: TextStyle(fontSize: 45),
        bodyText2: TextStyle(fontWeight: FontWeight.w300, fontSize: 30),
      ),
      primarySwatch: MaterialColor(_mainColorCode, _mainColor),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}