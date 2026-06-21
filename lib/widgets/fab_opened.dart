import 'package:flutter/material.dart';
import 'package:flutter11/widgets/meds.dart';

class FabOpened extends StatefulWidget {
  const FabOpened({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<FabOpened> createState() => _FabOpenedState();
}

class _FabOpenedState extends State<FabOpened> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 238, 238, 238),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        // Wir nutzen ein SingleChildScrollView, damit das DraggableScrollableSheet
        // sauber mit scrollController arbeiten kann, falls die Tastatur aufklappt.
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              // mainAxisSize.min sagt der Column: Sei nur so hoch wie deine Kinder!
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                // Visueller Handle zum Runterziehen
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                SearchBarClass(),
                const SizedBox(
                  height: 20,
                ), // Abstand nach unten zum Bildschirmrand
              ],
            ),
          ),
        ),
      ),
    );
  }
}
