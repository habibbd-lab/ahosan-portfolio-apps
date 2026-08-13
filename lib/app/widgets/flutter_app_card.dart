import 'package:flutter/material.dart';
import '../data/models/project_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'custom_button.dart';
import 'glass_card.dart';

class FlutterAppCard extends StatelessWidget {
  final ProjectModel app;
  final VoidCallback onPreview;
  final VoidCallback onSpecs;

  const FlutterAppCard({
    super.key,
    required this.app,
    required this.onPreview,
    required this.onSpecs,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App Icon Header Banner
          Container(
            height: 85,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryCyan.withOpacity(0.15),
                  AppColors.electricBlue.withOpacity(0.25),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.flutter_dash,
                        size: 28,
                        color: AppColors.primaryCyan,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        app.title,
                        style: AppTypography.subtitle.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundSecondary,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: Text(
                      app.status,
                      style: AppTypography.caption.copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentGreen,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      app.description,
                      style: AppTypography.body2.copyWith(fontSize: 10, height: 1.3),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: app.tags.take(2).map((tag) {
                      return Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceDark,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.glassBorder),
                        ),
                        child: Text(
                          tag,
                          style: AppTypography.caption.copyWith(fontSize: 8),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "See More",
                          isOutline: true,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          onPressed: onPreview,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: CustomButton(
                          text: "Specs",
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          onPressed: onSpecs,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
