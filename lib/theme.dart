
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final TextStyle unselectedLabelStyle = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w500,
    fontSize: 12);

final TextStyle selectedLabelStyle =
TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

ThemeData lightTheme =ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 0,
    titleSpacing: 20,
    color: Colors.white,
    systemOverlayStyle:SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 20,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    unselectedItemColor: Colors.black.withOpacity(0.5),
    selectedItemColor: Colors.black,
    unselectedLabelStyle: unselectedLabelStyle,
    selectedLabelStyle: selectedLabelStyle,

  ),
);

ThemeData darkTheme =ThemeData(
  primarySwatch: Colors.cyan,
  scaffoldBackgroundColor: Colors.grey,
  appBarTheme: AppBarTheme(
    elevation: 0,
    titleSpacing: 20,
    systemOverlayStyle:SystemUiOverlayStyle.dark,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.cyan,
    iconSize: 25,
    foregroundColor: Colors.black,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.white,
    elevation: 20,
    backgroundColor: Colors.cyan,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      )
  ),
);

