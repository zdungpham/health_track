import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_tracker/database_helper.dart';

class WaterCard extends StatefulWidget {
  const WaterCard({super.key});

  @override
  _WaterCardState createState() => _WaterCardState();
}

class _WaterCardState extends State<WaterCard> {
  int glassesCount = 0;

  @override
  void initState() {
    super.initState();
    _loadWaterCount();
  }

  Future<void> _loadWaterCount() async {
    final int waterCount = await DatabaseHelper().getWater();
    setState(() {
      glassesCount = waterCount;
    });
  }

  Future<void> _updateWaterCount() async {
    await DatabaseHelper().insertWater(glassesCount);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Water',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.water_drop,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (glassesCount > 0) {
                        glassesCount--;
                        _updateWaterCount();
                      }
                    });
                  },
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          '  -  ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  '$glassesCount/8 ',
                  style: const TextStyle(color: Colors.white),
                ),
                const FaIcon(FontAwesomeIcons.glassWater, color: Colors.white, size: 14, ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (glassesCount < 8) {
                        glassesCount++;
                        _updateWaterCount();
                      }
                    });
                  },
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          '  +  ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("1 glass =  250ml", style: TextStyle(color: Colors.white, fontSize: 14),)
              ],
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
