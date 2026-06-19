import 'package:flutter/material.dart';
import 'package:flutter11/models/navbarpainter.dart';

class Navbar extends StatelessWidget {
  final ValueChanged<int> onDestinationSelected;
  final int currentIndex;

  const Navbar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
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
        child: CustomPaint(
          painter: NavbarPainter(selectedIndex: 0, totalItems: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(Icons.home_outlined, Icons.home, "Home", 0),
              _buildNavItem(Icons.numbers_outlined, Icons.numbers, "Stats", 1),
              _buildNavItem(
                Icons.settings_outlined,
                Icons.settings,
                "Settings",
                2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
  ) {
    final isSelected = currentIndex == index;

    return InkWell(
      onTap: () {
        onDestinationSelected(index);
      },
      child: SizedBox(
        width: 80,
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
    );
  }
}
