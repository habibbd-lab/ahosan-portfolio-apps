import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/filter_chip.dart';
import '../../../widgets/flutter_app_card.dart';
import '../../../widgets/glass_card.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/stat_card.dart';
import '../../shell/controllers/shell_controller.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/flutter_apps_controller.dart';

class FlutterAppsView extends GetView<FlutterAppsController> {
  const FlutterAppsView({super.key});

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
                    tag: "MULTI-CATEGORY GALLERY",
                    title: "Portfolio Landing Hub",
                    subtitle:
                        "Select a specialized category to inspect high-resolution galleries, mobile app mockups, live website links, design artwork, and technical DevOps notes.",
                  ),
                  const SizedBox(height: 48),

                  // Hub Category Cards (6 Hubs - at least 2 per row)
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 2 : 3,
                    crossAxisSpacing: isMobile ? 12 : 20,
                    mainAxisSpacing: isMobile ? 12 : 20,
                    childAspectRatio: isMobile ? 0.78 : 1.45,
                    children: [
                      _buildHubCard("Flutter Applications", "12 Mobile Apps", "Chef Starz, Worker Hiring, Artisan, GetX, REST API", Icons.phone_android, AppRoutes.FLUTTER_APPS, shellController),
                      _buildHubCard("Web Portfolio", "6 Web Projects", "Corporate Business Sites, SaaS Pages, Admin", Icons.language, AppRoutes.PROJECTS, shellController),
                      _buildHubCard("Graphic Design", "10 Design Types", "Logos, Posters, Banners, Business Cards, Flyers", Icons.palette, AppRoutes.PROJECTS, shellController),
                      _buildHubCard("Video Portfolio", "5 Video Formats", "YouTube Tech Reviews, Reels, Shorts, Motion", Icons.videocam, AppRoutes.SERVICES, shellController),
                      _buildHubCard("AI Portfolio", "5 AI Workflows", "Midjourney Concept Art, AI Video Generation", Icons.smart_toy, AppRoutes.SERVICES, shellController),
                      _buildHubCard("DevOps Pathways", "6 Modules", "Linux Admin, Docker Containers, CI/CD", Icons.alt_route, AppRoutes.EDUCATION, shellController),
                    ],
                  ),
                  const SizedBox(height: 64),

                  // Portfolio Impact & Scale Metrics
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
                    "Portfolio Impact & Scale",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Real metrics reflecting Habib Hasan's multi-domain expertise and production experience across engineering & media.",
                    style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
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
                        StatCard(number: "10", label: "Videos & Motion"),
                        StatCard(number: "14", label: "Marketing Campaigns"),
                        StatCard(number: "8", label: "AI Workflows"),
                        StatCard(number: "6", label: "DevOps Labs"),
                      ],
                    ),
                    desktop: (context, constraints) => Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(child: StatCard(number: "55", label: "Total Projects")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "12", label: "Flutter Apps")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "15", label: "Websites & Portals")),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: const [
                            Expanded(child: StatCard(number: "20", label: "Designs & Branding")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "10", label: "Videos & Motion")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "14", label: "Marketing Campaigns")),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: const [
                            Expanded(child: StatCard(number: "8", label: "AI Workflows")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "6", label: "DevOps Labs")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "100%", label: "Satisfaction")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),

                  // Flutter Mobile Applications Section
                  Text(
                    "DART & FLUTTER ENGINEERING",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Flutter Mobile Showcase",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 24),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: CustomSearchBar(
                      hintText: "Search 12 Flutter mobile applications...",
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

                  // Flutter App Grid (at least 2 per row)
                  Obx(() {
                    final apps = controller.filteredApps;
                    if (apps.isEmpty) {
                      return const EmptyStateWidget(
                        title: "No Flutter Apps Found",
                        message: "No Flutter application matched your filter criteria.",
                      );
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 2 : 3,
                        crossAxisSpacing: isMobile ? 12 : 24,
                        mainAxisSpacing: isMobile ? 12 : 24,
                        childAspectRatio: isMobile ? 0.72 : 0.85,
                      ),
                      itemCount: apps.length,
                      itemBuilder: (context, index) {
                        final a = apps[index];
                        return FlutterAppCard(
                          app: a,
                          onPreview: () => controller.showAppPreview(a),
                          onSpecs: () => controller.showAppSpecs(a),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
            const GlobalFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHubCard(
    String title,
    String badge,
    String desc,
    IconData icon,
    String route,
    ShellController shellController,
  ) {
    return GlassCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryCyan.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.primaryCyan, size: 20),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceDark,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.glassBorder),
                  ),
                  child: Text(
                    badge,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      fontSize: 9.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: AppTypography.subtitle.copyWith(fontSize: 16)),
          const SizedBox(height: 4),
          Text(desc, style: AppTypography.caption, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 16),
          InkWell(
            onTap: () => shellController.navigateTo(route),
            child: Row(
              children: [
                Text(
                  "Explore Hub ->",
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primaryCyan,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
