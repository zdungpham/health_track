import 'package:flutter/material.dart';
import 'package:health_tracker/card/calories_card.dart';
import 'package:health_tracker/card/info_card.dart';
import 'package:health_tracker/card/meal_card.dart';
import 'package:health_tracker/card/step_card.dart';
import 'package:health_tracker/card/water_card.dart';
import 'package:health_tracker/greeting_bar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      
    });(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/calendar');
        break;
      case 2:
        Navigator.pushNamed(context, '/profile');
        break;
      case 3:
        Navigator.pushNamed(context, '/settings');
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GreetingBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
               IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CaloriesCard(),
                    InfoCard(),
                  ],
                ),
              ),
               SizedBox(height: 8.0),
               IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    WaterCard(),
                    StepCard(),
                  ],
                ),
              ),
               SizedBox(height: 8.0),
              MealCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Colors.white),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}