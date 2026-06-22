import 'package:flutter/material.dart';
import 'package:flutter11/models/Medeintrag.dart';
import 'package:flutter11/widgets/fab_opened.dart';

class Fab extends StatefulWidget {
  const Fab({super.key, required this.onEintragAdded});
  final ValueChanged<MedikamentenEintrag> onEintragAdded;
  @override
  _FabState createState() => _FabState();
}

class _FabState extends State<Fab> with TickerProviderStateMixin {
  void _showBottomSheet(BuildContext context) {
    final customAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ), // Geschwindigkeit beim Öffnen
      reverseDuration: const Duration(
        milliseconds: 350,
      ), // Geschwindigkeit beim Schließen
    );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      transitionAnimationController: customAnimationController,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.95,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return FabOpened(
              scrollController: scrollController,
              onEintragAdded: widget.onEintragAdded,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(eccentricity: 0),
      backgroundColor: Colors.black87,
      onPressed: () {
        _showBottomSheet(context); // Ruft die obige Funktion auf
      },
      child: const Icon(Icons.add, size: 30),
    );
  }
}
