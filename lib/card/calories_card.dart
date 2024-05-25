import 'package:flutter/material.dart';

class CaloriesCard extends StatefulWidget {
  const CaloriesCard({super.key});

  @override
  _CaloriesCardState createState() => _CaloriesCardState();
}

class _CaloriesCardState extends State<CaloriesCard> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Card(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Calories',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: 0.73,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                    strokeWidth: 10,
                  ),
                ),
                Text(
                  '735 kCal',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
