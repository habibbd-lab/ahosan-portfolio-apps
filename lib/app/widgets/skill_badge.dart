import 'package:flutter/material.dart';
import '../data/models/skill_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'glass_card.dart';

class SkillBadge extends StatelessWidget {
  final SkillModel skill;
  final VoidCallback? onExpand;

  const SkillBadge({
    super.key,
    required this.skill,
    this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryCyan.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primaryCyan.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: const Icon(
                  Icons.code,
                  color: AppColors.primaryCyan,
                  size: 20,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Text(
                  skill.level,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primaryCyan,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            skill.name,
            style: AppTypography.subtitle,
          ),
          const SizedBox(height: 4),
          Text(
            skill.description,
            style: AppTypography.body2,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: skill.percentage / 100,
                    minHeight: 6,
                    backgroundColor: AppColors.surfaceDark,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primaryCyan,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "${skill.percentage}%",
                style: AppTypography.caption.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          if (onExpand != null) ...[
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onExpand,
                icon: const Icon(Icons.info_outline, size: 14),
                label: const Text("Expand Details"),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.textMuted,
                  textStyle: AppTypography.caption,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
