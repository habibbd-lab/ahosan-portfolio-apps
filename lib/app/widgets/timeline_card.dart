import 'package:flutter/material.dart';
import '../data/models/experience_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'glass_card.dart';

class TimelineCard extends StatelessWidget {
  final ExperienceModel experience;
  final VoidCallback? onTap;

  const TimelineCard({
    super.key,
    required this.experience,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(12),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primaryCyan.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.primaryCyan.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    experience.tenureBadge,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      fontSize: 8.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              if (experience.dateRange.isNotEmpty) ...[
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    experience.dateRange,
                    textAlign: TextAlign.right,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w600,
                      fontSize: 8.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Text(
            experience.company,
            style: AppTypography.title2.copyWith(fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            experience.title,
            style: AppTypography.subtitle.copyWith(
              color: AppColors.primaryCyan,
              fontSize: 11,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Expanded(
            child: Text(
              experience.description,
              style: AppTypography.body2.copyWith(fontSize: 10, height: 1.3),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: experience.tags.take(2).map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Text(
                  tag,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primaryCyan,
                    fontSize: 8,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 6),
          InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "See More ->",
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primaryCyan,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 9,
                  color: AppColors.primaryCyan,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
