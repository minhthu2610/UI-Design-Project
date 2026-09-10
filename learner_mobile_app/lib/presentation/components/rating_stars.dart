import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final int reviewCount;
  final bool showNumber;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 14,
    this.reviewCount = 0,
    this.showNumber = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded, color: AppColors.accent, size: size),
        if (showNumber) ...[
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(
              fontSize: size * 0.9,
              fontWeight: FontWeight.bold,
              color: AppColors.textHeading,
            ),
          ),
        ],
        if (reviewCount > 0) ...[
          const SizedBox(width: 2),
          Text(
            ' ($reviewCount)',
            style: TextStyle(
              fontSize: size * 0.85,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ],
    );
  }
}
