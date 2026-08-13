import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/portfolio_data_provider.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/filter_chip.dart';
import '../../../widgets/glass_card.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/skill_badge.dart';
import '../../../widgets/stat_card.dart';
import '../../shell/controllers/shell_controller.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/skills_controller.dart';

class SkillsView extends GetView<SkillsController> {
  const SkillsView({super.key});

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
                    tag: "MY SKILLS",
                    title: "Technologies & Professional Expertise",
                    subtitle:
                        "Showcase technical skills, creative expertise, and continuous learning through an engaging interactive experience.",
                  ),
                  const SizedBox(height: 48),

                  // Senior Expertise & Career Roadmap Split
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: [
                        _buildSeniorExpertiseCard(),
                        const SizedBox(height: 24),
                        _buildCareerRoadmapCard(),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 5, child: _buildSeniorExpertiseCard()),
                        const SizedBox(width: 32),
                        Expanded(flex: 7, child: _buildCareerRoadmapCard()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 56),

                  // Top Featured Skills
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.accentYellow, size: 22),
                      const SizedBox(width: 8),
                      Text("Top Featured Skills", style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 2 : 3,
                      crossAxisSpacing: isMobile ? 12 : 20,
                      mainAxisSpacing: isMobile ? 12 : 20,
                      childAspectRatio: isMobile ? 1.05 : 1.25,
                    ),
                    itemCount: controller.topFeaturedSkills.length,
                    itemBuilder: (context, index) {
                      final s = controller.topFeaturedSkills[index];
                      return SkillBadge(
                        skill: s,
                        onExpand: () => controller.showSkillDetails(s),
                      );
                    },
                  ),
                  const SizedBox(height: 64),

                  // Interactive Skill Catalog
                  Text(
                    "Interactive Skill Catalog",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Use category filters or type in the search box to filter skill cards live.",
                    style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 24),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: CustomSearchBar(
                      hintText: "Search skills (e.g. Flutter, REST API, Docker, SEO...)",
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
                  const SizedBox(height: 36),

                  // Skill Catalog Grid (at least 2 per row)
                  Obx(() {
                    final skills = controller.filteredSkills;
                    if (skills.isEmpty) {
                      return const EmptyStateWidget(
                        title: "No Skills Found",
                        message: "No technical skills matched your search query.",
                      );
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 2 : 3,
                        crossAxisSpacing: isMobile ? 12 : 20,
                        mainAxisSpacing: isMobile ? 12 : 20,
                        childAspectRatio: isMobile ? 1.05 : 1.25,
                      ),
                      itemCount: skills.length,
                      itemBuilder: (context, index) {
                        final s = skills[index];
                        return SkillBadge(
                          skill: s,
                          onExpand: () => controller.showSkillDetails(s),
                        );
                      },
                    );
                  }),
                  const SizedBox(height: 64),

                  // DevOps & Cloud Infrastructure Roadmap
                  GlassCard(
                    padding: EdgeInsets.all(isMobile ? 24 : 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.accentGreen.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.accentGreen.withOpacity(0.4)),
                              ),
                              child: Text(
                                "CURRENTLY LEARNING",
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.accentGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "DevOps & Cloud Infrastructure",
                          style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Active continuous learning roadmap (No fake percentages — real hands-on progression!)",
                          style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                        ),
                        const SizedBox(height: 32),

                        ResponsiveBuilder(
                          mobile: (context, constraints) => Column(
                            children: [
                              _buildDevOpsStepCard("Step 1: In-Progress", "Linux & Ubuntu", "Bash CLI, permissions, SSH setup, and server OS administration.", AppColors.accentYellow),
                              const SizedBox(height: 16),
                              _buildDevOpsStepCard("Step 2: Active", "Docker Containers", "Containerizing apps, Dockerfiles, and Docker Compose networks.", AppColors.primaryCyan),
                              const SizedBox(height: 16),
                              _buildDevOpsStepCard("Step 3: Exploring", "NGINX & Cloud Basics", "Reverse proxy configuration, SSL termination, and cloud servers.", AppColors.electricBlue),
                              const SizedBox(height: 16),
                              _buildDevOpsStepCard("Step 4: Target", "GitHub Actions CI/CD", "Automated testing, build pipelines, and zero-downtime deployment.", AppColors.accentGreen),
                            ],
                          ),
                          desktop: (context, constraints) => GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1.8,
                            children: [
                              _buildDevOpsStepCard("Step 1: In-Progress", "Linux & Ubuntu", "Bash CLI, permissions, SSH setup, and server OS administration.", AppColors.accentYellow),
                              _buildDevOpsStepCard("Step 2: Active", "Docker Containers", "Containerizing apps, Dockerfiles, and Docker Compose networks.", AppColors.primaryCyan),
                              _buildDevOpsStepCard("Step 3: Exploring", "NGINX & Cloud Basics", "Reverse proxy configuration, SSL termination, and cloud servers.", AppColors.electricBlue),
                              _buildDevOpsStepCard("Step 4: Target", "GitHub Actions CI/CD", "Automated testing, build pipelines, and zero-downtime deployment.", AppColors.accentGreen),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),

                  // Career Highlights & Metrics
                  Text(
                    "Career Highlights & Metrics",
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
                        StatCard(number: "30+", label: "Projects Built"),
                        StatCard(number: "15+", label: "Live Projects"),
                        StatCard(number: "25+", label: "Technologies Learned"),
                        StatCard(number: "2+", label: "Years Experience"),
                        StatCard(number: "10+", label: "Creative Skills"),
                        StatCard(number: "12+", label: "Certificates Earned"),
                      ],
                    ),
                    desktop: (context, constraints) => Column(
                      children: [
                        Row(
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
                        const SizedBox(height: 16),
                        Row(
                          children: const [
                            Expanded(child: StatCard(number: "10+", label: "Creative Skills")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "5+", label: "Learning Tracks")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "12+", label: "Certificates Earned")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "100%", label: "Client Satisfaction")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),

                  // Ready to Hire CTA Banner
                  GlassCard(
                    padding: EdgeInsets.all(isMobile ? 28 : 48),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primaryCyan.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.primaryCyan.withOpacity(0.3)),
                          ),
                          child: Text(
                            "READY TO HIRE OR COLLABORATE?",
                            style: AppTypography.caption.copyWith(
                              color: AppColors.primaryCyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          "Let's Build Award-Winning Digital Products Together",
                          style: AppTypography.title1.copyWith(fontSize: isMobile ? 22 : 32),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 650),
                          child: Text(
                            "Review my full qualifications, explore live deployed project demos, or reach out directly for full-time roles, contract consulting, and freelance development.",
                            textAlign: TextAlign.center,
                            style: AppTypography.body1.copyWith(color: AppColors.textSecondary),
                          ),
                        ),
                        const SizedBox(height: 28),
                        isMobile
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          text: "Resume",
                                          icon: Icons.download,
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                          onPressed: () => shellController.copyToClipboard(PortfolioDataProvider.email, "Resume"),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: CustomButton(
                                          text: "Hire Me",
                                          isOutline: true,
                                          icon: Icons.work_outline,
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                          onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          text: "Projects",
                                          isOutline: true,
                                          icon: Icons.folder_outlined,
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                          onPressed: () => shellController.navigateTo(AppRoutes.PROJECTS),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: CustomButton(
                                          text: "Contact",
                                          isOutline: true,
                                          icon: Icons.chat_bubble_outline,
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                          onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                alignment: WrapAlignment.center,
                                children: [
                                  CustomButton(
                                    text: "Download Resume",
                                    icon: Icons.download,
                                    onPressed: () => shellController.copyToClipboard(PortfolioDataProvider.email, "Resume"),
                                  ),
                                  CustomButton(
                                    text: "Hire Me",
                                    isOutline: true,
                                    icon: Icons.work_outline,
                                    onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                                  ),
                                  CustomButton(
                                    text: "View Projects",
                                    isOutline: true,
                                    icon: Icons.folder_outlined,
                                    onPressed: () => shellController.navigateTo(AppRoutes.PROJECTS),
                                  ),
                                  CustomButton(
                                    text: "Contact Me",
                                    isOutline: true,
                                    icon: Icons.chat_bubble_outline,
                                    onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
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

  Widget _buildSeniorExpertiseCard() {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryCyan.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.psychology, color: AppColors.primaryCyan, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  "Senior Expertise",
                  style: AppTypography.subtitle.copyWith(fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            "Specialized in building high-performance Flutter mobile apps, responsive Desktop/Vanilla JS web architectures, and stunning graphic identities without heavy bloated frameworks.",
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildCareerRoadmapCard() {
    final steps = [
      {'title': 'Graphic Design Learning', 'desc': 'Photoshop, Illustrator & Brand Identity'},
      {'title': 'Flutter Development', 'desc': 'Dart, GetX, REST API & Mobile UI'},
      {'title': 'Web Development', 'desc': 'HTML5, CSS3, Bootstrap 5 & ES6 JS'},
      {'title': 'Professional Experience', 'desc': 'Sparktech Agency Flutter Developer'},
      {'title': 'Live Projects', 'desc': '30+ Client Apps & Responsive Sites'},
      {'title': 'DevOps Learning', 'desc': 'Linux, Docker, NGINX & CI/CD'},
      {'title': 'Future Goals', 'desc': 'Full Stack & Cloud Architecture'},
    ];

    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.alt_route, color: AppColors.primaryCyan, size: 20),
              const SizedBox(width: 8),
              Text("Career Roadmap", style: AppTypography.subtitle.copyWith(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 16),
          ...steps.map((step) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.primaryCyan,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(step['title']!, style: AppTypography.body2.copyWith(fontWeight: FontWeight.bold)),
                        Text(step['desc']!, style: AppTypography.caption),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDevOpsStepCard(String badge, String title, String description, Color color) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              badge,
              style: AppTypography.caption.copyWith(color: color, fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
          const SizedBox(height: 10),
          Text(title, style: AppTypography.subtitle.copyWith(fontSize: 15)),
          const SizedBox(height: 4),
          Text(description, style: AppTypography.caption, maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
