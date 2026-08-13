import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/service_model.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/modal_dialog.dart';
import '../../shell/controllers/shell_controller.dart';

class ServicesController extends GetxController {
  final PortfolioRepository repository = PortfolioRepository();

  late final List<ServiceModel> services;

  @override
  void onInit() {
    super.onInit();
    services = repository.getServices();
  }

  void showServiceDetails(ServiceModel service) {
    final shellController = Get.find<ShellController>();

    ModalDialog.show(
      title: service.title,
      subtitle: "Estimated Timeline: ${service.estimatedTimeline}",
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overview Section
            Text(
              "OVERVIEW",
              style: AppTypography.caption.copyWith(
                color: AppColors.primaryCyan,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              service.description,
              style: AppTypography.body1.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),

            // Key Features & Benefits
            Text(
              "⭐ Key Features & Benefits",
              style: AppTypography.subtitle.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 10),
            ...service.keyFeatures.map((f) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle, size: 14, color: AppColors.accentGreen),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        f,
                        style: AppTypography.body2.copyWith(color: AppColors.textPrimary),
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 20),

            // Development Process
            Text(
              "⚡ Development Process",
              style: AppTypography.subtitle.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              service.developmentProcess.join(" -> "),
              style: AppTypography.body2.copyWith(
                color: AppColors.primaryCyan,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),

            // Technologies Used
            if (service.technologiesUsed.isNotEmpty) ...[
              Text(
                "TECHNOLOGIES USED",
                style: AppTypography.caption.copyWith(
                  color: AppColors.primaryCyan,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: service.technologiesUsed.map((t) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceDark,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: Text(
                      t,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.primaryCyan,
                        fontSize: 11,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],

            // Deliverables
            Text(
              "DELIVERABLES",
              style: AppTypography.caption.copyWith(
                color: AppColors.primaryCyan,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              service.deliverables.join(", "),
              style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 20),

            // Frequently Asked Questions
            if (service.faqs.isNotEmpty) ...[
              Text(
                "FREQUENTLY ASKED QUESTIONS",
                style: AppTypography.caption.copyWith(
                  color: AppColors.primaryCyan,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              ...service.faqs.map((faq) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    title: Text(
                      faq["q"]!,
                      style: AppTypography.body2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          faq["a"]!,
                          style: AppTypography.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "Close",
            style: AppTypography.button.copyWith(color: AppColors.textMuted),
          ),
        ),
        const SizedBox(width: 8),
        CustomButton(
          text: "Inquire Service Now",
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          onPressed: () {
            Get.back();
            shellController.navigateTo(AppRoutes.CONTACT);
          },
        ),
      ],
    );
  }
}
