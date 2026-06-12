import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const assetName = 'assets/drop.svg';
final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Dart Logo');

class Tropfen extends StatefulWidget {
  const Tropfen({super.key});

  @override
  _TropfenState createState() => _TropfenState();
}

class _TropfenState extends State<Tropfen> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
    );
  }
}
