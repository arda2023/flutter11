import 'package:flutter/material.dart';
import 'package:flutter11/plusminus.dart';
import 'package:flutter11/tropfen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentMl = 0;
  final int _stepMl = 250;

  void pressedPlus() {
    if (_currentMl < 1000) {
      setState(() {
        _currentMl += _stepMl;
      });
    }
  }

  void pressedMinus() {
    if (_currentMl > 0) {
      setState(() {
        _currentMl -= _stepMl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.blue,
                ),
                height: 350,
                width: double.infinity,
                child: Tropfen(aktuelleMl: _currentMl),
              ),
              SizedBox(height: 26),
              Plusminus(
                onPlusPressed: pressedPlus,
                onMinusPressed: pressedMinus,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
