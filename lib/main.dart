import 'package:coinz/Application/Application.dart';
import 'package:coinz/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/Home/currency_ alarm/currency _alarm_screen.dart';
import 'modules/Home/currency_price/currency_price_screen.dart';
import 'modules/Home/home_screen.dart';
import 'modules/Home/news_report/news_screen.dart';
import 'modules/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
  Application.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}