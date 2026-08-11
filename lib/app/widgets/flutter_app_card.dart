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
            height: 120,
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
                      const Icon(
                        Icons.flutter_dash,
                        size: 38,
                        color: AppColors.primaryCyan,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        app.title,
                        style: AppTypography.subtitle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundSecondary,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: Text(
                      app.status,
                      style: AppTypography.caption.copyWith(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentGreen,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app.description,
                  style: AppTypography.body2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: app.tags.map((tag) {
                    return Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceDark,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: Text(
                        tag,
                        style: AppTypography.caption.copyWith(fontSize: 10),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Preview",
                        isOutline: true,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        onPressed: onPreview,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomButton(
                        text: "Specs",
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        onPressed: onSpecs,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
