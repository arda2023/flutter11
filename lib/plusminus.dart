import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const List<int> _optionen = <int>[250, 500, 1000];
const double _kItemExtent = 32.0;

class Plusminus extends StatefulWidget {
  const Plusminus({
    super.key,
    required this.onPlusPressed,
    required this.onMinusPressed,
    required this.onStepSelected,
    required this.currentStep,
  });
  final VoidCallback onPlusPressed;
  final VoidCallback onMinusPressed;
  final ValueChanged<int> onStepSelected;
  final int currentStep;

  @override
  _PlusminusState createState() => _PlusminusState();
}

class _PlusminusState extends State<Plusminus> {
  final int _selectedOption = 0;
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
              onPressed: widget.onMinusPressed,
              // Keine Breite setzen, das übernimmt das Expanded!
            ),
          ),
        ),

        // Abstand zwischen Minus und Textbox
        const SizedBox(width: 12),

        // 2. Mittlerer Anzeige-Container
        /* Expanded(
          child: GestureDetector(
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 250,
                    color: Colors.white,
                    child: CupertinoPicker(
                      itemExtent: _kItemExtent,
                      onSelectedItemChanged: (int selectedItem) {
                        setState(() {
                          _selectedOption = selectedItem;
                        });
                      },

                      children: _optionen.map((int wert) {
                        return Text("$wert ml");
                      }).toList(),
                    ),
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(
                  12,
                ), // Leicht abgerundet wie im Bild
                // Eine sehr dezente graue Umrandung, passend zu Shadcn UI Outlines
                border: Border.all(width: 1, color: Colors.grey.shade200),
              ),
              child: Center(child: Text("${widget.currentStep} ml")),
            ),
          ),
        ), */

        // Abstand zwischen Textbox und Plus
        const SizedBox(width: 12),

        // 3. Plus Button
        Expanded(
          child: SizedBox(
            height: 48,
            child: ShadIconButton.outline(
              icon: const Icon(LucideIcons.plus),
              onPressed: widget.onPlusPressed,
            ),
          ),
        ),
      ],
    );
  }
}
