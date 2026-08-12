import 'package:flutter/material.dart';
import '../data/models/service_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'custom_button.dart';
import 'glass_card.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback onLearnMore;
  final VoidCallback onRequest;

  const ServiceCard({
    super.key,
    required this.service,
    required this.onLearnMore,
    required this.onRequest,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryCyan.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.primaryCyan.withOpacity(0.3),
              ),
            ),
            child: const Icon(
              Icons.design_services,
              color: AppColors.primaryCyan,
              size: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            service.title,
            style: AppTypography.subtitle,
          ),
          const SizedBox(height: 8),
          Text(
            service.description,
            style: AppTypography.body2,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Text(
            "KEY FEATURES",
            style: AppTypography.caption.copyWith(
              color: AppColors.primaryCyan,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 8),
          ...service.keyFeatures.take(3).map((feat) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 14,
                    color: AppColors.accentGreen,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feat,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "Learn More",
                  isOutline: true,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  onPressed: onLearnMore,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomButton(
                  text: "Request Service",
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  onPressed: onRequest,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
