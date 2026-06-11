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
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.set_meal)),
        ShadIconButton.outline(
          icon: const Icon(LucideIcons.rocket),
          onPressed: () => print('Outline'),
        ),
      ],
    );
  }
}
