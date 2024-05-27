import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:arc_progress_bar_new/arc_progress_bar_new.dart';
import 'package:health_tracker/calendar_screen.dart';
import 'package:health_tracker/card/calories_card.dart';
import 'package:health_tracker/greeting_bar.dart';
import 'package:health_tracker/card/info_card.dart';
import 'package:health_tracker/card/meal_card.dart';
import 'package:health_tracker/card/step_card.dart';
import 'package:health_tracker/card/water_card.dart';
import 'package:health_tracker/my_home_page.dart';
import 'package:health_tracker/profile_screen.dart';
import 'package:health_tracker/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
     // theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      routes: {
        '/home': (context) => MyHomePage(),
        '/profile': (context) => const ProfileScreen(),
        '/calendar': (context) =>  CalendarScreen(),
        // '/setting': (context) => const Setting(),
      },
    );
  }
}


