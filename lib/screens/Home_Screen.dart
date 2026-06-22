import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter11/models/Medeintrag.dart';
import 'package:flutter11/screens/Home_Content.dart';
import 'package:flutter11/screens/Stats.dart';
import 'package:flutter11/screens/settings.dart';
import 'package:flutter11/widgets/fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = const [HomeContent(), StatsPage(), SettingsPage()];

  int currentPageIndex = 0;
  List<MedikamentenEintrag> meineMedikamente = [
    MedikamentenEintrag(
      dosis: _gewaehlteDosisInSheet,
      name: _gewaehltesMedikamentInSheet,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(child: pages[currentPageIndex]),
      bottomNavigationBar: Container(
        color: Colors.black87,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom > 0
                ? MediaQuery.of(context)
                      .padding
                      .bottom // Nutzt den sicheren Abstand des Handys
                : 15.0, // Fallback für ältere Handys ohne Notch/Home-Geste
          ),
          child: CurvedNavigationBar(
            index: currentPageIndex,

            height: 75.0,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            buttonBackgroundColor: Colors.black87,
            color: Colors.black87,
            items: <Widget>[
              Icon(Icons.add, size: 30, color: Colors.white),
              Icon(Icons.list, size: 30, color: Colors.white),
              Icon(Icons.compare_arrows, size: 30, color: Colors.white),
            ],
            onTap: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
        ),
      ),

      floatingActionButton: Fab(),
    );
  }
}
