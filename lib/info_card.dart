import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget{
  const InfoCard({super.key});
  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard>{
  @override
  Widget build(BuildContext context) {
    return const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.grey,
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.person_rounded,
                                        color: Colors.white, size: 20),
                                    SizedBox(width: 8),
                                    Text('Age: 27',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.male,
                                        color: Colors.white,
                                        size: 20), 
                                    SizedBox(width: 8),
                                    Text('Gender: Male',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14)), 
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.fitness_center,
                                        color: Colors.white,
                                        size: 20), 
                                    SizedBox(width: 8),
                                    Text('Weight: 25',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14)), 
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.straighten,
                                        color: Colors.white,
                                        size: 20), 
                                    SizedBox(width: 8),
                                    Text('Height: 25',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14)), 
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text('24.6',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14)),
                                        Text('BMI',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('24.6',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14)),
                                        Text('Fat',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
  }
}