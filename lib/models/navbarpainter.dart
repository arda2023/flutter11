import 'package:flutter/material.dart';

class NavbarPainter extends CustomPainter {
  final double selectedIndex;
  final int totalItems;
  NavbarPainter({required this.selectedIndex, required this.totalItems});
  @override
  void paint(Canvas canvas, Size size) {
    final rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(30),
    );
    canvas.clipRRect(rRect);

    // Statt einer festen 5 nutzen wir die Variable von außen:
    final double segmentBreite = size.width / totalItems;
    final double zielX = (segmentBreite * selectedIndex) + (segmentBreite / 2);
    final paint = Paint()
      ..color = const Color(0xFFD2C1FF)
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start oben links
    path.moveTo(0, 0);

    // Bis kurz vor die Aussparung
    path.lineTo(zielX - 45, 0);

    // Kurve für die Aussparung
    path.cubicTo(zielX - 25, 0, zielX - 30, 28, zielX, 28);
    path.cubicTo(
      zielX + 30,
      28, // 3. Kontrollpunkt: Hält die Kurve rechts unten noch kurz flach
      zielX + 25,
      0, // 4. Kontrollpunkt: Zieht die Kurve sanft zur Oberkante hoch
      zielX + 45,
      0, // Das physikalische Ziel: Wieder flach auf der Oberkante landen
    );

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
    final strokePaint = Paint()
      ..color = Colors
          .purple
          .shade900 // Passend zu deinen Icons ein dunkles Lila
      ..style = PaintingStyle
          .stroke // WICHTIG: Stroke bedeutet Kontur statt Füllung
      ..strokeWidth = 2.0; // Die Dicke der Linie in Pixeln

    canvas.drawPath(path, paint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant NavbarPainter oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex;
  }
}
