import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/settings.png'),
                color: Color(0xFF5F725F)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/catalogue.png'),
                color: Color(0xFF5F725F)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/home.png'),
                color: Color(0xFF5F725F)),
            label: '',
          ),
        ],
      );
  }
}
