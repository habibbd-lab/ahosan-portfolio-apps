import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class SectionHeader extends StatelessWidget {
  final String tag;
  final String title;
  final String? subtitle;
  final Alignment alignment;

  const SectionHeader({
    super.key,
    required this.tag,
    required this.title,
    this.subtitle,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final isCenter = alignment == Alignment.center;

    return Column(
      crossAxisAlignment:
          isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryCyan.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.primaryCyan.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Text(
            tag.toUpperCase(),
            style: AppTypography.caption.copyWith(
              color: AppColors.primaryCyan,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          style: AppTypography.title1,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              subtitle!,
              textAlign: isCenter ? TextAlign.center : TextAlign.start,
              style: AppTypography.body1,
            ),
          ),
        ],
      ],
    );
  }
}
