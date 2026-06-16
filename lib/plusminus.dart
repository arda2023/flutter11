import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const List<int> _optionen = <int>[100, 250, 500, 750, 1000];
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
  int _selectedOption = 0;
  final _popoverController = ShadPopoverController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 1. Minus Button
        Expanded(
          child: SizedBox(
            height: 48,
            child: ShadIconButton.outline(
              icon: const Icon(LucideIcons.minus),
              onPressed: widget.onMinusPressed,
            ),
          ),
        ),

        const SizedBox(width: 12),

        // 2. Mittlerer Anzeige-Container
        Expanded(
          child: ShadPopover(
            controller: _popoverController,
            popover: (context) => SizedBox(
              width: 150,
              height: 150,
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: _kItemExtent,
                      selectionOverlay: const SizedBox(),
                      looping: true,
                      scrollController: FixedExtentScrollController(
                        initialItem: _selectedOption,
                      ),
                      onSelectedItemChanged: (int selectedItem) {
                        setState(() {
                          _selectedOption = selectedItem;
                        });
                      },

                      children: _optionen.map((int wert) {
                        return Text(
                          "$wert ml",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 10),
                  ShadButton(
                    onPressed: () {
                      widget.onStepSelected(_optionen[_selectedOption]);
                      _popoverController.toggle();
                    },
                    width: double.infinity,
                    child: const Text('Primary'),
                  ),
                ],
              ),
            ),
            child: GestureDetector(
              onTap: _popoverController.toggle,

              child: SizedBox(
                height: 48,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.grey.shade200),
                  ),
                  child: Center(child: Text("${widget.currentStep}ml")),
                ),
              ),
            ),
          ),
        ),

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
