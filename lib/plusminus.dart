import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Plusminus extends StatefulWidget {
  const Plusminus({super.key});

  @override
  _PlusminusState createState() => _PlusminusState();
}

class _PlusminusState extends State<Plusminus> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 1. Minus Button
        Expanded(
          child: SizedBox(
            height: 48, // Feste Höhe für ein gutes Klickgefühl
            child: ShadIconButton.outline(
              icon: const Icon(LucideIcons.minus),
              onPressed: () => print('Minus'),
              // Keine Breite setzen, das übernimmt das Expanded!
            ),
          ),
        ),

        // Abstand zwischen Minus und Textbox
        const SizedBox(width: 12),

        // 2. Mittlerer Anzeige-Container
        Expanded(
          child: Container(
            height: 48, // Gleiche Höhe wie die Buttons
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(
                12,
              ), // Leicht abgerundet wie im Bild
              // Eine sehr dezente graue Umrandung, passend zu Shadcn UI Outlines
              border: Border.all(width: 1, color: Colors.grey.shade200),
            ),
            child: const Center(
              child: Text(
                "250 ml",
                style: TextStyle(
                  color: Colors.blue, // Blaue Schrift wie im Bild
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),

        // Abstand zwischen Textbox und Plus
        const SizedBox(width: 12),

        // 3. Plus Button
        Expanded(
          child: SizedBox(
            height: 48,
            child: ShadIconButton.outline(
              icon: const Icon(LucideIcons.plus),
              onPressed: () => print('Plus'),
            ),
          ),
        ),
      ],
    );
  }
}
