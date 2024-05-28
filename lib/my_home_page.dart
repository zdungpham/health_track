import 'package:flutter/material.dart';
import 'package:health_tracker/card/calories_card.dart';
import 'package:health_tracker/card/info_card.dart';
import 'package:health_tracker/card/meal_card.dart';
import 'package:health_tracker/card/step_card.dart';
import 'package:health_tracker/card/water_card.dart';
import 'package:health_tracker/greeting_bar.dart';
import 'package:health_tracker/bottom_navigator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          GreetingBar(),
           SingleChildScrollView(
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
        ],
      ),
      bottomNavigationBar: BottomNavigatorBar(),
    );
  }
}