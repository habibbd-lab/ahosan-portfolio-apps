import 'package:flutter/material.dart';
import '../data/models/project_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import 'glass_card.dart';
import 'project_image_slider.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Workspace Header Banner with Image Slider
          Stack(
            children: [
              ProjectImageSlider(
                images: project.images,
                height: 120,
                projectTitle: project.title,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primaryCyan.withOpacity(0.4)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: AppColors.accentGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        project.status,
                        style: AppTypography.caption.copyWith(
                          fontSize: 8.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tech tags
                  Wrap(
                    spacing: 3,
                    runSpacing: 3,
                    children: project.tags.take(2).map((tag) {
                      return Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primaryCyan.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: AppColors.primaryCyan.withOpacity(0.2),
                          ),
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
                  Text(
                    project.title,
                    style: AppTypography.subtitle.copyWith(fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Expanded(
                    child: Text(
                      project.description,
                      style: AppTypography.body2.copyWith(fontSize: 10, height: 1.3),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
