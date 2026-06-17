import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Animate(
        effects: [
          FadeEffect(duration: 600.ms),
          SlideEffect(curve: Curves.easeIn),
        ],
        child: Text('Home Content', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
