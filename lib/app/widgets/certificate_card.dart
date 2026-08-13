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
      padding: const EdgeInsets.all(10),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: certificate.isVerified
                      ? AppColors.accentGreen.withOpacity(0.1)
                      : AppColors.accentOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: certificate.isVerified
                        ? AppColors.accentGreen
                        : AppColors.accentOrange,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      certificate.isVerified
                          ? Icons.verified
                          : Icons.access_time_filled,
                      size: 10,
                      color: certificate.isVerified
                          ? AppColors.accentGreen
                          : AppColors.accentOrange,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      certificate.isVerified ? "Verified" : "Planned",
                      style: AppTypography.caption.copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: certificate.isVerified
                            ? AppColors.accentGreen
                            : AppColors.accentOrange,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  certificate.date,
                  textAlign: TextAlign.right,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 9,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            certificate.title,
            style: AppTypography.subtitle.copyWith(fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            certificate.institute,
            style: AppTypography.caption.copyWith(
              color: AppColors.primaryCyan,
              fontWeight: FontWeight.w600,
              fontSize: 10,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Text(
              certificate.description,
              style: AppTypography.body2.copyWith(fontSize: 10, height: 1.3),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: certificate.skills.take(2).map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Text(
                  skill,
                  style: AppTypography.caption.copyWith(fontSize: 8),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "ID: ${certificate.credentialId}",
                  style: AppTypography.caption.copyWith(
                    fontFamily: 'monospace',
                    color: AppColors.textMuted,
                    fontSize: 8,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "See More ->",
                style: AppTypography.caption.copyWith(
                  color: AppColors.primaryCyan,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
