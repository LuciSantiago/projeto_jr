import 'package:flutter/material.dart';

class Tema {
  Tema._();
  static final ThemeData primary = ThemeData(
    primarySwatch: TemaPrincipal.primaryColor,
    primaryColor: const Color(0xff266386),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff266386),
    ),
  );
}

class TemaPrincipal {
  static const MaterialColor primaryColor = MaterialColor(
    0xff266386,
    <int, Color>{
      50: Color(0xff266386),
      100: Color(0xff266386),
      200: Color(0xff266386),
      300: Color(0xff266386),
      400: Color(0xff266386),
      500: Color(0xff266386),
      600: Color(0xff266386),
      700: Color(0xff266386),
      800: Color(0xff266386),
      900: Color(0xff266386),
    },
  );
}
