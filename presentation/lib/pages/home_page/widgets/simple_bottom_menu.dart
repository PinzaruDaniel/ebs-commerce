import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:animations/animations.dart';

import '../../../util/widgets/open_container_animation_widget.dart';
import '../../profile_page/profile_page.dart';

class SimpleBottomMenu extends StatefulWidget {
  const SimpleBottomMenu({super.key});

  @override
  State<SimpleBottomMenu> createState() => _SimpleBottomMenuState();
}

class _SimpleBottomMenuState extends State<SimpleBottomMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20),

        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButton(Icons.home, 'Home', 0, onTap: () {
            }),
            _buildButton(Icons.search, 'Search', 1, onTap: () {
            }),
            _buildButton(Icons.person, 'Profile', 2, onTap: () {
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, String label, int index, {VoidCallback? onTap}) {
    final isSelected = selectedIndex == index;

    return OpenContainerAnimation(
      closedShape: const RoundedRectangleBorder(),
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onTap: () {
            setState(() => selectedIndex = index);
            if (onTap != null) onTap();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: isSelected ? Colors.white : Colors.white70, size: 26),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white70,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      },
      openBuilder: (context, closeContainer) {
        if (index == 2) return ProfilePage();
        return Container();
      },
    );
  }
}