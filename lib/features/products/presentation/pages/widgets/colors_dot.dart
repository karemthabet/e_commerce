
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorDot({super.key, required this.color, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: AppColors.blueColor, width: 2) : null,
      ),
      child: CircleAvatar(
        radius: 12,
        backgroundColor: color,
      ),
    );
  }
}
