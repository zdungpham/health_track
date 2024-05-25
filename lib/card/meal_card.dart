import 'package:flutter/material.dart';

class MealCard extends StatefulWidget {
  const MealCard({super.key});
  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
   String _selectedFood = 'Vegetable';
  int _calories = 200;
   final List<Map<String, dynamic>> _foodItems = [
    {
      'name': 'Salad',
      'calories': 200,
      'image': 'assets/images/Salad.jfif',
    },
    {
      'name': 'Fruit',
      'calories': 100,
      'image': 'assets/images/fruit.jfif',
    },
    {
      'name': 'Chicken',
      'calories': 250,
      'image': 'assets/images/chicken.jfif',
    },
  ];
  void _showFoodMenu() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          
          children: _foodItems.map((food) {
            return ListTile(
              leading: Image.asset(
                food['image'],
                width: 50,
                height: 50,
              ),
              title: Text(food['name']),
              subtitle: Text('${food['calories']} cals'),
              onTap: () {
                setState(() {
                  _selectedFood = food['name'];
                  _calories = food['calories'];
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/hungry.png',
              height: 100,
              width: 100,
            ),
            const Text('You have not eaten anything yet', style: TextStyle(color: Colors.white),),
            const Text("Don't let yourself hungry", style: TextStyle(color: Colors.white),),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.restaurant_menu, color: Colors.black),
              onPressed: _showFoodMenu,
              label: const Text('Add meal'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _selectedFood,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(
              '$_calories cals',
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
