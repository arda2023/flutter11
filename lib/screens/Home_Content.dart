import 'package:flutter/material.dart';
import 'package:flutter11/widgets/med_card.dart'; // 1. HIER die Karte importieren!

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Abstand zu den Bildschirmrändern
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Richtet Text links aus
        children: [
          const Text(
            'Meine Medikamente',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color:
                  Colors.black, // Damit man es auf dem weißen Hintergrund sieht
            ),
          ),
          const SizedBox(height: 20), // Abstand zwischen Text und deiner Box
          // HIER platziere ich deine neue MedCard!
          const MedCard(),
        ],
      ),
    );
  }
}
