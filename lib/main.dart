import 'package:flutter/material.dart';
import 'package:arc_progress_bar_new/arc_progress_bar_new.dart';
import 'package:health_tracker/calendar_screen.dart';
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
        '/home': (context) => const MyHomePage(),
        '/profile': (context) => const ProfileScreen(),
        '/calendar': (context) => const  CalendarScreen(),
        // '/setting': (context) => const Setting(),
      },
    );
  }
}


