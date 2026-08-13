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
    final isMobile = MediaQuery.of(context).size.width < 600;

    return GlassCard(
      padding: EdgeInsets.all(isMobile ? 14 : 18),
      onTap: onLearnMore,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryCyan.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primaryCyan.withOpacity(0.3),
                  ),
                ),
                child: Icon(
                  Icons.design_services,
                  color: AppColors.primaryCyan,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            service.title,
            style: AppTypography.subtitle.copyWith(
              fontSize: isMobile ? 15 : 17,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            service.description,
            style: AppTypography.body2.copyWith(
              color: AppColors.textSecondary,
              fontSize: isMobile ? 12 : 13,
              height: 1.4,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            "KEY FEATURES",
            style: AppTypography.caption.copyWith(
              color: AppColors.primaryCyan,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 6),
          ...service.keyFeatures.take(2).map((feat) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 13,
                    color: AppColors.accentGreen,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      feat,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: isMobile ? 11 : 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "See More",
                  isOutline: true,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  onPressed: onLearnMore,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomButton(
                  text: "Request",
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
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
