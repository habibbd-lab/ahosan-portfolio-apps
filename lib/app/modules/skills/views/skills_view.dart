import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/filter_chip.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/skill_badge.dart';
import '../../../widgets/stat_card.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/skills_controller.dart';

class SkillsView extends GetView<SkillsController> {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    tag: "My Skills",
                    title: "Technologies & Professional Expertise",
                    subtitle: "Showcase technical skills, creative expertise, and continuous learning through an engaging interactive experience.",
                  ),
                  const SizedBox(height: 48),

                  // Top Featured Skills
                  Text("⭐ Top Featured Skills", style: AppTypography.subtitle),
                  const SizedBox(height: 24),
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: controller.topFeaturedSkills.map((s) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: SkillBadge(
                            skill: s,
                            onExpand: () => controller.showSkillDetails(s),
                          ),
                        );
                      }).toList(),
                    ),
                    desktop: (context, constraints) => Row(
                      children: controller.topFeaturedSkills.map((s) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SkillBadge(
                              skill: s,
                              onExpand: () => controller.showSkillDetails(s),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 64),

                  // Search & Category Filters
                  Text("Interactive Skill Catalog", style: AppTypography.title2),
                  const SizedBox(height: 8),
                  Text("Use category filters or type in the search box to filter skill cards live.", style: AppTypography.body2),
                  const SizedBox(height: 24),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: CustomSearchBar(
                      hintText: "Search skills (e.g. Flutter, REST API, Docker, SEO...)",
                      onChanged: controller.updateSearch,
                    ),
                  ),

                  const SizedBox(height: 24),

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

                  const SizedBox(height: 36),

                  // Skill Grid Catalog
                  Obx(() {
                    final skills = controller.filteredSkills;
                    if (skills.isEmpty) {
                      return const EmptyStateWidget(
                        title: "No Skills Found",
                        message: "No technical skills matched your search query.",
                      );
                    }

                    return ResponsiveBuilder(
                      mobile: (context, constraints) => Column(
                        children: skills.map((s) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: SkillBadge(
                              skill: s,
                              onExpand: () => controller.showSkillDetails(s),
                            ),
                          );
                        }).toList(),
                      ),
                      desktop: (context, constraints) => GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1.25,
                        ),
                        itemCount: skills.length,
                        itemBuilder: (context, index) {
                          final s = skills[index];
                          return SkillBadge(
                            skill: s,
                            onExpand: () => controller.showSkillDetails(s),
                          );
                        },
                      ),
                    );
                  }),

                  const SizedBox(height: 64),

                  // Career Highlights Metrics
                  Text("Career Highlights & Metrics", style: AppTypography.title2),
                  const SizedBox(height: 24),
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: const [
                        StatCard(number: "30+", label: "Projects Built"),
                        SizedBox(height: 16),
                        StatCard(number: "15+", label: "Live Projects"),
                        SizedBox(height: 16),
                        StatCard(number: "25+", label: "Technologies Learned"),
                        SizedBox(height: 16),
                        StatCard(number: "2+", label: "Years Experience"),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      children: const [
                        Expanded(child: StatCard(number: "30+", label: "Projects Built")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "15+", label: "Live Projects")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "25+", label: "Technologies Learned")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "2+", label: "Years Experience")),
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
