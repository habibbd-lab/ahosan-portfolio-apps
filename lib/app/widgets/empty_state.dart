import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'glass_card.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const EmptyStateWidget({
    super.key,
    this.title = "No Items Found",
    this.message = "Try adjusting your search query or filter options.",
    this.icon = Icons.search_off,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: AppColors.textMuted),
          const SizedBox(height: 16),
          Text(title, style: AppTypography.subtitle),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTypography.body2,
          ),
        ],
      ),
    );
  }
}
