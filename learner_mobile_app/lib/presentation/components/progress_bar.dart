import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress; // 0.0 to 100.0
  final double height;
  final Color color;

  const CustomProgressBar({
    super.key,
    required this.progress,
    this.height = 6,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    final double clampedProgress = (progress / 100).clamp(0.0, 1.0);
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.divider,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: clampedProgress,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
      ),
    );
  }
}
