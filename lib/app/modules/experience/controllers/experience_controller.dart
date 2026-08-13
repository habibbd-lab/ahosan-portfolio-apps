import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/experience_model.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/modal_dialog.dart';

class ExperienceController extends GetxController {
  final PortfolioRepository repository = PortfolioRepository();

  final RxString selectedCategory = 'All Milestones'.obs;
  late final List<ExperienceModel> allExperiences;

  final List<String> categories = [
    'All Milestones',
    'Professional Work',
    'Education & Training',
  ];

  @override
  void onInit() {
    super.onInit();
    allExperiences = repository.getExperiences();
  }

  List<ExperienceModel> get filteredExperiences {
    if (selectedCategory.value == 'All Milestones') {
      return allExperiences;
    }
    return allExperiences
        .where((e) => e.category == selectedCategory.value)
        .toList();
  }

  void selectCategory(String cat) {
    selectedCategory.value = cat;
  }

  void showExperienceDetails(ExperienceModel exp) {
    ModalDialog.show(
      title: exp.company,
      subtitle: "${exp.title} • ${exp.dateRange}",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryCyan.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primaryCyan.withOpacity(0.3)),
            ),
            child: Text(
              exp.tenureBadge,
              style: AppTypography.caption.copyWith(
                color: AppColors.primaryCyan,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            exp.description,
            style: AppTypography.body1.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Skills & Focus Areas:",
            style: AppTypography.subtitle.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: exp.tags.map((t) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Text(
                  t,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primaryCyan,
                    fontWeight: FontWeight.bold,
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
