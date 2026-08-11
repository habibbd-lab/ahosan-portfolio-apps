import 'package:flutter/material.dart';
import '../data/models/experience_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'glass_card.dart';

class TimelineCard extends StatelessWidget {
  final ExperienceModel experience;

  const TimelineCard({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryCyan.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primaryCyan.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  experience.tenureBadge,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primaryCyan,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                experience.dateRange,
                style: AppTypography.caption.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            experience.company,
            style: AppTypography.title2.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 4),
          Text(
            experience.title,
            style: AppTypography.subtitle.copyWith(
              color: AppColors.primaryCyan,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            experience.description,
            style: AppTypography.body1,
          ),
          const SizedBox(height: 16),
          Text(
            "RESPONSIBILITIES & ACHIEVEMENTS:",
            style: AppTypography.caption.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 8),
          ...experience.responsibilities.map((resp) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 14,
                      color: AppColors.accentGreen,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      resp,
                      style: AppTypography.body2,
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: experience.tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Text(
                  tag,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primaryCyan,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
