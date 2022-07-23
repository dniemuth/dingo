import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: Colors.green,
  // cardColor: const Color(0xff38283D),
  cardColor: const Color(0xff251E28),
  // scaffoldBackgroundColor: const Color(0xff1F0F25),
  scaffoldBackgroundColor: Colors.black87,
  primaryColor: Colors.lime,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff5B027A),
    onPrimary: Colors.white,
    secondary: Color(0xff9900CE),
    onSecondary: Colors.black,
    tertiary: Color(0xff98ff98),
    onTertiary: Colors.black,
    error: Color(0xffB00200),
    onError: Colors.white,
    // background: Color(0xff212121),
    background: Colors.green,
    onBackground: Colors.white,
    surface: Color(0xff5B027A),
    // surface: Colors.amber,
    onSurface: Colors.white,
  )
  
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: const Color(0xffebebeb),
  scaffoldBackgroundColor: const Color(0xffebebeb),
  cardColor: Colors.white,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff5B027A),
    onPrimary: Colors.white,
    secondary: Color(0xff5B027A),
    onSecondary: Colors.white,
    tertiary: Color(0xff98ff98),
    onTertiary: Colors.black,
    error: Color(0xffB00200),
    onError: Colors.white,
    background: Color(0xffebebeb),
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Color(0xff5B027A),
  )
);
