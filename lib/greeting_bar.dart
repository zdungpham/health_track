import 'package:flutter/material.dart';

class GreetingBar extends StatelessWidget implements PreferredSizeWidget{
  const GreetingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(getGreeting(), style: const TextStyle(color: Colors.white),),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 6 && hour < 12) {
      return 'Chào buổi sáng';
    } else if (hour >= 12 && hour < 17) {
      return 'Chào buổi chiều';
    } else {
      return 'Chào buổi tối';
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}