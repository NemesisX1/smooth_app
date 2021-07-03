import 'package:flutter/material.dart';
import 'constants.dart';

/// Global app theme manager
ThemeData appTheme = ThemeData(
  accentColor: Color(0xffCD6709),
  primaryColor: Color(0xffE8A05D),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          color: Color(0xffCD6709),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      shape: MaterialStateProperty.all<OutlinedBorder>(
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
    backgroundColor: kRed,
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: Color(0xffCD6709),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffE8A05D),
      ),
    ),
  ),
  primaryColorBrightness: Brightness.light,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        Color(0xffCD6709),
      ),
    ),
  ),
);
