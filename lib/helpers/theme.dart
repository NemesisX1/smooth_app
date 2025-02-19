import 'package:flutter/material.dart';

/// Global app theme manager
ThemeData appTheme = ThemeData(
  primaryColorLight: Color(0xffCD6709),
  primaryColor: Color(0xffE8A05D),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all<TextStyle>(
        TextStyle(
          color: Color(0xffCD6709),
        ),
      ),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xffE8A05D),
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    elevation: 0,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xffE8A05D),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Color(0xffE8A05D),
    ),
    labelStyle: TextStyle(
      color: Colors.grey,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffE8A05D),
      ),
    ),
    focusColor: Color(0xffCD6709),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffE8A05D),
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xffE8A05D)),
    ),
  ),
  brightness: Brightness.light,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
        Color(0xffCD6709),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: Color(0xffE8A05D),
      size: 35,
    ),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
    ),
  ),
);
