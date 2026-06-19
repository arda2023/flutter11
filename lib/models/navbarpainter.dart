import 'package:flutter/material.dart';

class NavbarPainter extends CustomPainter {
  final int selectedIndex;
  final int totalItems;
  NavbarPainter({required this.selectedIndex, required this.totalItems});
  @override
  void paint(Canvas canvas, Size size) {
    // Statt einer festen 5 nutzen wir die Variable von außen:
    final double segmentBreite = size.width / totalItems;
    final double zielX = (segmentBreite * selectedIndex) + (segmentBreite / 2);
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start oben links
    path.moveTo(0, 0);

    // Bis kurz vor die Aussparung
    path.lineTo(zielX - 40, 0);

    // Kurve für die Aussparung
    path.cubicTo(zielX - 20, 0, zielX - 20, 35, zielX + 40, 0);

    // Rest der oberen Kante
    path.lineTo(size.width, 0);

    // Rechte Seite nach unten
    path.lineTo(size.width, size.height);

    // Untere Seite nach links
    path.lineTo(0, size.height);

    // Zurück zum Startpunkt
    path.close();

    // Ganz am Ende zeichnen
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant NavbarPainter oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex;
  }
}
