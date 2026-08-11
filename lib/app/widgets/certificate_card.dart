import 'package:flutter/material.dart';
import '../data/models/certificate_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'glass_card.dart';

class CertificateCard extends StatelessWidget {
  final CertificateModel certificate;
  final VoidCallback onTap;

  const CertificateCard({
    super.key,
    required this.certificate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: certificate.isVerified
                      ? AppColors.accentGreen.withOpacity(0.1)
                      : AppColors.accentOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: certificate.isVerified
                        ? AppColors.accentGreen
                        : AppColors.accentOrange,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      certificate.isVerified
                          ? Icons.verified
                          : Icons.access_time_filled,
                      size: 12,
                      color: certificate.isVerified
                          ? AppColors.accentGreen
                          : AppColors.accentOrange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      certificate.isVerified ? "Verified Credential" : "Planned",
                      style: AppTypography.caption.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: certificate.isVerified
                            ? AppColors.accentGreen
                            : AppColors.accentOrange,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                certificate.date,
                style: AppTypography.caption.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            certificate.title,
            style: AppTypography.subtitle,
          ),
          const SizedBox(height: 4),
          Text(
            certificate.institute,
            style: AppTypography.caption.copyWith(
              color: AppColors.primaryCyan,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            certificate.description,
            style: AppTypography.body2,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: certificate.skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Text(
                  skill,
                  style: AppTypography.caption.copyWith(fontSize: 10),
                ),
              );
            }).toList(),
          ),
          const Spacer(),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ID: ${certificate.credentialId}",
                style: AppTypography.caption.copyWith(
                  fontFamily: 'monospace',
                  color: AppColors.textMuted,
                  fontSize: 10,
                ),
              ),
              Text(
                "Details ->",
                style: AppTypography.caption.copyWith(
                  color: AppColors.primaryCyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
