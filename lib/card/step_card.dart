import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StepCard extends StatefulWidget {
  const StepCard({super.key});

  @override
  _StepCardState createState() => _StepCardState();
}

class _StepCardState extends State<StepCard> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Card(
        color: Colors.orange,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Step', style: TextStyle(color: Colors.white, fontSize: 18),),
                  SizedBox(height: 10),
                  FaIcon(FontAwesomeIcons.personRunning, color: Colors.white,)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('1456/6000', style: TextStyle(color: Colors.white)),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
