import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
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
                horizontal: isMobile ? 24 : 64,
                vertical: 64,
              ),
              child: Column(
                children: [
                  const SectionHeader(
                    tag: "My Journey",
                    title: "Experience, Education & Professional Growth",
                    subtitle: "Presenting a professional journey demonstrating real-world software engineering, continuous learning, and creative development.",
                  ),
                  const SizedBox(height: 36),

                  // Category Filters
                  Obx(() {
                    return Wrap(
                      spacing: 12,
                      runSpacing: 12,
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

                  // Experience Timeline List
                  Obx(() {
                    final experiences = controller.filteredExperiences;
                    return ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: Column(
                        children: experiences.map((exp) {
                          return TimelineCard(experience: exp);
                        }).toList(),
                      ),
                    );
                  }),

                  const SizedBox(height: 64),

                  // Career Metrics Banner
                  Text("Professional Career Metrics", style: AppTypography.title2),
                  const SizedBox(height: 24),
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: const [
                        StatCard(number: "35+", label: "Total Client Projects"),
                        SizedBox(height: 16),
                        StatCard(number: "99%", label: "Client Satisfaction Rate"),
                        SizedBox(height: 16),
                        StatCard(number: "15+", label: "Live Production Apps"),
                        SizedBox(height: 16),
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
                    padding: EdgeInsets.all(isMobile ? 24 : 48),
                    child: Column(
                      children: [
                        Text("Looking for a Dedicated Flutter & Frontend Engineer?", style: AppTypography.title2, textAlign: TextAlign.center),
                        const SizedBox(height: 12),
                        Text(
                          "Whether you need to scale an existing mobile app codebase, build a high-converting web architecture, or design a world-class brand identity, I am ready to deliver excellence.",
                          textAlign: TextAlign.center,
                          style: AppTypography.body1,
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          text: "Schedule an Interview",
                          onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
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
