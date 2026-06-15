import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _dropAsset = 'assets/tropfen.svg';

class Tropfen extends StatelessWidget {
  const Tropfen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        _dropAsset,
        width: 180,
        height: 260,
        fit: BoxFit.contain,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        semanticsLabel: 'Tropfen',
      ),
    );
  }
}
