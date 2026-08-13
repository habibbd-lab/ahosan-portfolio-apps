import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/filter_chip.dart';
import '../../../widgets/glass_card.dart';
import '../../../widgets/project_card.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/stat_card.dart';
import '../../shell/controllers/shell_controller.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/projects_controller.dart';

class ProjectsView extends GetView<ProjectsController> {
  const ProjectsView({super.key});

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
                    tag: "MY PROJECTS",
                    title: "Featured Projects & Professional Work",
                    subtitle:
                        "Showcase Flutter apps, websites, creative works, AI projects, and real-world development experience engineered with precision and modern UI standards.",
                  ),
                  const SizedBox(height: 36),

                  // Featured Spotlight Banner (Chef Starz)
                  GlassCard(
                    padding: EdgeInsets.all(isMobile ? 20 : 32),
                    child: ResponsiveBuilder(
                      mobile: (context, constraints) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSpotlightVisual(),
                          const SizedBox(height: 20),
                          _buildSpotlightDetails(shellController),
                        ],
                      ),
                      desktop: (context, constraints) => Row(
                        children: [
                          Expanded(flex: 5, child: _buildSpotlightVisual()),
                          const SizedBox(width: 32),
                          Expanded(flex: 7, child: _buildSpotlightDetails(shellController)),
                        ],
                      ),
                    ),
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
                  const SizedBox(height: 20),

                  Obx(() {
                    return Wrap(
                      spacing: 8,
                      runSpacing: 8,
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
                  const SizedBox(height: 40),

                  // Project Grid
                  Obx(() {
                    final projects = controller.filteredProjects;
                    if (projects.isEmpty) {
                      return const EmptyStateWidget(
                        title: "No Projects Found",
                        message: "No project records match your current search query or category filter.",
                      );
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 2 : 3,
                        crossAxisSpacing: isMobile ? 12 : 24,
                        mainAxisSpacing: isMobile ? 12 : 24,
                        childAspectRatio: isMobile ? 0.72 : 0.82,
                      ),
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        final p = projects[index];
                        return ProjectCard(
                          project: p,
                          onTap: () => controller.showProjectDetails(p),
                        );
                      },
                    );
                  }),
                  const SizedBox(height: 64),

                  // Tech Stack & Tools Section
                  Text(
                    "TECH STACK & TOOLS",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Technologies Powering My Work",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Core tools, languages, and frameworks utilized across mobile development, web engineering, graphic design, and DevOps labs.",
                    style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: const [
                      _TechChip(label: "Flutter", icon: Icons.phone_android),
                      _TechChip(label: "Dart", icon: Icons.code),
                      _TechChip(label: "HTML5", icon: Icons.html),
                      _TechChip(label: "CSS3", icon: Icons.css),
                      _TechChip(label: "Bootstrap 5", icon: Icons.grid_view),
                      _TechChip(label: "JavaScript (ES6)", icon: Icons.javascript),
                      _TechChip(label: "jQuery", icon: Icons.code),
                      _TechChip(label: "REST API", icon: Icons.sync),
                      _TechChip(label: "JSON", icon: Icons.data_object),
                      _TechChip(label: "Git", icon: Icons.alt_route),
                      _TechChip(label: "GitHub", icon: Icons.code),
                      _TechChip(label: "Responsive Design", icon: Icons.devices),
                    ],
                  ),
                  const SizedBox(height: 64),

                  // Portfolio Metrics
                  Text(
                    "PORTFOLIO METRICS",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Projects & Deliverables Scale",
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
                        StatCard(number: "55", label: "Total Projects"),
                        StatCard(number: "12", label: "Flutter Apps"),
                        StatCard(number: "15", label: "Websites & Portals"),
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

  Widget _buildSpotlightVisual() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryCyan.withOpacity(0.4)),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Image.asset(
              'assets/icons/chef_starz_banner.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryCyan.withOpacity(0.4)),
              ),
              child: Text(
                "FEATURED SPOTLIGHT",
                style: AppTypography.caption.copyWith(
                  color: AppColors.primaryCyan,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpotlightDetails(ShellController shellController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Chef Starz Mobile App",
          style: AppTypography.title2.copyWith(fontSize: 22),
        ),
        const SizedBox(height: 8),
        Text(
          "On-demand gourmet chef booking and food ordering mobile application built at Sparktech Agency. Features real-time chef booking, interactive menu customization, Stripe payment integration, REST API backend sync, GetX state bindings, and production-grade responsive UI architecture.",
          style: AppTypography.body2.copyWith(color: AppColors.textSecondary, height: 1.5),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            _TagBadge(label: "Flutter"),
            _TagBadge(label: "Dart"),
            _TagBadge(label: "GetX"),
            _TagBadge(label: "REST API"),
            _TagBadge(label: "Stripe API"),
          ],
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: "View Live Demo ->",
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          onPressed: () => shellController.navigateTo(AppRoutes.FLUTTER_APPS),
        ),
      ],
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const _TechChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.primaryCyan),
          const SizedBox(width: 6),
          Text(label, style: AppTypography.caption.copyWith(color: AppColors.textPrimary, fontSize: 12)),
        ],
      ),
    );
  }
}

class _TagBadge extends StatelessWidget {
  final String label;

  const _TagBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryCyan.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryCyan.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontSize: 11),
      ),
    );
  }
}
