import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/filter_chip.dart';
import '../../../widgets/project_card.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/stat_card.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/projects_controller.dart';

class ProjectsView extends GetView<ProjectsController> {
  const ProjectsView({super.key});

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
                    tag: "My Projects",
                    title: "Featured Projects & Professional Work",
                    subtitle: "Showcase Flutter apps, websites, creative works, AI projects, and real-world development experience engineered with precision.",
                  ),
                  const SizedBox(height: 48),

                  // Search Bar & Filter Chips
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: CustomSearchBar(
                      hintText: "Search by project, technology, category, or keyword...",
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

                  const SizedBox(height: 48),

                  // Project Grid
                  Obx(() {
                    final projects = controller.filteredProjects;
                    if (projects.isEmpty) {
                      return const EmptyStateWidget(
                        title: "No Projects Found",
                        message: "No project records match your current search query or category filter.",
                      );
                    }

                    return ResponsiveBuilder(
                      mobile: (context, constraints) => Column(
                        children: projects.map((p) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: ProjectCard(
                              project: p,
                              onTap: () => controller.showProjectDetails(p),
                            ),
                          );
                        }).toList(),
                      ),
                      desktop: (context, constraints) => GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          childAspectRatio: 0.82,
                        ),
                        itemCount: projects.length,
                        itemBuilder: (context, index) {
                          final p = projects[index];
                          return ProjectCard(
                            project: p,
                            onTap: () => controller.showProjectDetails(p),
                          );
                        },
                      ),
                    );
                  }),

                  const SizedBox(height: 64),

                  // Projects & Deliverables Scale
                  Text("Projects & Deliverables Scale", style: AppTypography.title2),
                  const SizedBox(height: 24),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: const [
                        StatCard(number: "55", label: "Total Projects"),
                        SizedBox(height: 16),
                        StatCard(number: "12", label: "Flutter Apps"),
                        SizedBox(height: 16),
                        StatCard(number: "15", label: "Websites & Portals"),
                        SizedBox(height: 16),
                        StatCard(number: "20", label: "Designs & Branding"),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      children: const [
                        Expanded(child: StatCard(number: "55", label: "Total Projects")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "12", label: "Flutter Apps")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "15", label: "Websites & Portals")),
                        SizedBox(width: 16),
                        Expanded(child: StatCard(number: "20", label: "Designs & Branding")),
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
