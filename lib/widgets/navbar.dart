import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final ValueChanged<int> onDestinationSelected;
  final int currentIndex;

  const Navbar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: null);
  }
}
