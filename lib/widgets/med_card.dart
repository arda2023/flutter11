import 'package:flutter/material.dart';

class MedCard extends StatelessWidget {
  const MedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(22),
      ),
      height: 100,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              "Elvanse",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "30mg",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
