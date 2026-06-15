import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _dropAsset = 'assets/tropfen.svg';

class Tropfen extends StatefulWidget {
  const Tropfen({super.key, required this.aktuelleMl});

  final int aktuelleMl;

  @override
  State<Tropfen> createState() => _TropfenState();
}

class _TropfenState extends State<Tropfen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          _dropAsset,
          width: 180,
          height: 260,
          fit: BoxFit.contain,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          semanticsLabel: 'Tropfen',
        ),
        Text("${widget.aktuelleMl}"),
      ],
    );
  }
}
