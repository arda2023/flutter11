import 'package:flutter/material.dart';

class Tropfen extends StatefulWidget {
  const Tropfen({super.key});

  @override
  _TropfenState createState() => _TropfenState();
}

class _TropfenState extends State<Tropfen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Icon(Icons.water_drop_outlined));
  }
}
