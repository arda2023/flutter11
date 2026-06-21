import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter11/screens/Home_Content.dart';
import 'package:flutter11/screens/Stats.dart';
import 'package:flutter11/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotchBottomBarController controller = NotchBottomBarController();

  final List<Widget> pages = const [HomeContent(), StatsPage(), SettingsPage()];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],

      bottomNavigationBar: SizedBox(
        height: 100,
        child: AnimatedNotchBottomBar(
          notchBottomBarController: controller,

          kIconSize: 24,
          kBottomRadius: 28,

          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Icon(Icons.home_outlined),
              activeItem: Icon(Icons.home),
              itemLabel: 'Home',
            ),
            BottomBarItem(
              inActiveItem: Icon(Icons.bar_chart_outlined),
              activeItem: Icon(Icons.bar_chart),
              itemLabel: 'Stats',
            ),
            BottomBarItem(
              inActiveItem: Icon(Icons.settings_outlined),
              activeItem: Icon(Icons.settings),
              itemLabel: 'Settings',
            ),
          ],

          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
