import 'package:flutter/material.dart';
import 'package:flutter11/home.dart';
import 'package:flutter11/stats.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  final pages = [const HomePage(), const Statistics()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Stats'),
        ],
      ),
    );
  }
}
