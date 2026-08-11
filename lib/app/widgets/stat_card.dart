import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'glass_card.dart';

class StatCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData? icon;

  const StatCard({
    super.key,
    required this.number,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, color: AppColors.primaryCyan, size: 28),
            const SizedBox(height: 8),
          ],
          ShaderMask(
            shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
            child: Text(
              number,
              style: AppTypography.heroHeading.copyWith(
                fontSize: 36,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
