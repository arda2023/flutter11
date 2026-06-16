import 'dart:core';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

final List<String>
int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
        final pages = [
      const HomePage(),
      const NotificationPage(),
    ];
    return Scaffold(body: NavigationBar(  onDestinationSelected: (int index) {
    setState(() {
      currentPageIndex = index;
    });
  }, destinations: [NavigationDestination(icon: Icon(Icons.home_outlined), label: "home", selectedIcon: Icon(Icons.home),)] ));
  }
}
