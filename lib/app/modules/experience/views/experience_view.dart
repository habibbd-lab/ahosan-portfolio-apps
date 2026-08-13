import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/portfolio_data_provider.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/filter_chip.dart';
import '../../../widgets/glass_card.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/stat_card.dart';
import '../../../widgets/timeline_card.dart';
import '../../shell/controllers/shell_controller.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/experience_controller.dart';

class ExperienceView extends GetView<ExperienceController> {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    final shellController = Get.find<ShellController>();
    final isMobile = ResponsiveBuilder.isMobile(context);

    return ShellView(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 64,
                vertical: isMobile ? 32 : 56,
              ),
              child: Column(
                children: [
                  // Section Header
                  const SectionHeader(
                    tag: "MY JOURNEY",
                    title: "Experience, Education & Professional Growth",
                    subtitle:
                        "Presenting a professional journey demonstrating real-world software engineering, continuous learning, and creative development.",
                  ),
                  const SizedBox(height: 36),

                  // Category Filters
                  Obx(() {
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: controller.categories.map((cat) {
                        return CustomFilterChip(
                          label: cat,
                          isSelected: controller.selectedCategory.value == cat,
                          onTap: () => controller.selectCategory(cat),
                        );
                      }).toList(),
                    );
                  }),
                  const SizedBox(height: 48),

                  // Experience Grid (at least 2 per row)
                  Obx(() {
                    final experiences = controller.filteredExperiences;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 2 : 3,
                        crossAxisSpacing: isMobile ? 12 : 24,
                        mainAxisSpacing: isMobile ? 12 : 24,
                        childAspectRatio: isMobile ? 0.68 : 0.85,
                      ),
                      itemCount: experiences.length,
                      itemBuilder: (context, index) {
                        final exp = experiences[index];
                        return TimelineCard(
                          experience: exp,
                          onTap: () => controller.showExperienceDetails(exp),
                        );
                      },
                    );
                  }),
                  const SizedBox(height: 56),

                  // Professional Career Metrics
                  Text(
                    "PROVEN TRACK RECORD",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Professional Career Metrics",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 24),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: isMobile ? 1.05 : 1.35,
                      children: const [
                        StatCard(number: "35+", label: "Total Client Projects"),
                        StatCard(number: "99%", label: "Client Satisfaction Rate"),
                        StatCard(number: "15+", label: "Live Production Apps"),
                        StatCard(number: "3+", label: "Years of Dedication"),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      children: const [
                        Expanded(child: StatCard(number: "35+", label: "Total Client Projects")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "99%", label: "Client Satisfaction Rate")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "15+", label: "Live Production Apps")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "3+", label: "Years of Dedication")),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),

                  // CTA Banner
                  GlassCard(
                    padding: EdgeInsets.all(isMobile ? 28 : 48),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primaryCyan.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.primaryCyan.withOpacity(0.3)),
                          ),
                          child: Text(
                            "LET'S CONNECT",
                            style: AppTypography.caption.copyWith(
                              color: AppColors.primaryCyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Looking for a Dedicated Flutter & Frontend Engineer?",
                          style: AppTypography.title1.copyWith(fontSize: isMobile ? 22 : 32),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 680),
                          child: Text(
                            "Whether you need to scale an existing mobile app codebase, build a high-converting web architecture, or design a world-class brand identity, I am ready to deliver excellence.",
                            textAlign: TextAlign.center,
                            style: AppTypography.body1.copyWith(color: AppColors.textSecondary),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          alignment: WrapAlignment.center,
                          children: [
                            CustomButton(
                              text: "Download Full Resume",
                              icon: Icons.download,
                              onPressed: () => shellController.copyToClipboard(PortfolioDataProvider.email, "Resume"),
                            ),
                            CustomButton(
                              text: "Schedule an Interview",
                              isOutline: true,
                              icon: Icons.calendar_month,
                              onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                            ),
                            CustomButton(
                              text: "Explore Tech Stack",
                              isOutline: true,
                              icon: Icons.code,
                              onPressed: () => shellController.navigateTo(AppRoutes.SKILLS),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const GlobalFooter(),
          ],
        ),
      ),
    );
  }
}
