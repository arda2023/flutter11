import 'package:flutter/material.dart';
import 'package:flutter11/plusminus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              ),
              Expanded(child: Plusminus()),
            ],
          ),
        ),
      ),
    );
  }
}
