import 'package:flutter/material.dart';
import 'package:flutter11/screens/Home_Content.dart';
import 'package:flutter11/screens/Stats.dart';
import 'package:flutter11/screens/settings.dart';
import 'package:flutter11/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = [
    const HomeContent(),
    const StatsPage(),
    const SettingsPage(),
  ];
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(
        currentIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),

      body: pages[currentPageIndex],
    );
  }
}
