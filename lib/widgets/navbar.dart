import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final ValueChanged<int> onDestinationSelected;
  final int currentIndex;

  const Navbar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: null);
  }
}
/*BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onDestinationSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.numbers_outlined),
          activeIcon: Icon(Icons.numbers),
          label: 'Stats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          activeIcon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],*/