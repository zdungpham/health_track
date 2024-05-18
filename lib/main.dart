import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chào buổi sáng'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.green,
                          child: Column(
                            children: [
                              Text('Calories'),
                              CircularProgressIndicator(
                                value: 0.73,
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation(Colors.green),
                              ),
                              Text('730 kCal'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: Colors.grey,
                          child: Column(
                            children: [
                              Text('Age: 25'),
                              Text('Gender: Male'),
                              Text('Weight: 25'),
                              Text('Height: 25'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('24.6'),
                                      Text('BMI'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('24.6'),
                                      Text('Fat'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.blue,
                          child: Column(
                            children: [
                              Text('Water'),
                              Text('0/8'),
                              Text('1 glass = 250ml'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: Colors.orange,
                          child: Column(
                            children: [
                              Text('Step'),
                              Text('1456/6000'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Image.asset('assets/meal.png'),
                        Text('Vegetable'),
                        Text('200 cals'),
                      ],
                    ),
                  ),
                  // Repeat the Card for more meals as needed
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
