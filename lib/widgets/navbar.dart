import 'package:flutter/material.dart';
import 'package:flutter11/models/navbarpainter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatefulWidget {
  final ValueChanged<int> onDestinationSelected;
  final int currentIndex;

  const Navbar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    animation = AlwaysStoppedAnimation(widget.currentIndex.toDouble());
  }

  @override
  void didUpdateWidget(Navbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      animation =
          Tween<double>(
            begin: oldWidget.currentIndex.toDouble(),
            end: widget.currentIndex.toDouble(),
          ).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic),
          );

      controller.forward(from: 0.0);
    }
  }

  // Wir fügen hier auch direkt das Saubermachen hinzu, um Abstürze zu verhindern:
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("${widget.currentIndex}");
    // Berechne die Breite eines Segments basierend auf dem verfügbaren Platz:
    // Da wir links und rechts 24px Padding haben, nehmen wir die Bildschirmbreite minus 48
    final double gesamtBreite = MediaQuery.of(context).size.width - 48;
    final double segmentBreite = gesamtBreite / 3;
    final double aktivesZielX =
        (segmentBreite * widget.currentIndex) + (segmentBreite / 2);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: NavbarPainter(
                      selectedIndex:
                          animation.value, // Der fließende Komma-Wert
                      totalItems: 3,
                    ),
                  );
                },
              ),
            ),
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNavItem(Icons.home_outlined, Icons.home, "Home", 0),
                  buildNavItem(
                    Icons.numbers_outlined,
                    Icons.numbers,
                    "Stats",
                    1,
                  ),
                  buildNavItem(
                    Icons.settings_outlined,
                    Icons.settings,
                    "Settings",
                    2,
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOutCubic,
              left: aktivesZielX - 12,
              top: -10,
              child: SvgPicture.asset(
                "assets/tropfen.svg",
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  Colors.purple.shade900,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
  ) {
    final isSelected = widget.currentIndex == index;

    return InkWell(
      onTap: () {
        print("geklickt: $index");
        widget.onDestinationSelected(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutBack,

        width: 80,
        child: Padding(
          padding: EdgeInsets.only(top: isSelected ? 15 : 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSelected ? activeIcon : icon,
                color: Colors.purple.shade900,
                size: 26,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: Colors.purple.shade900,
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ...
}
