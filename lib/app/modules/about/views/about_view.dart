import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/portfolio_data_provider.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/glass_card.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/section_header.dart';
import '../../shell/controllers/shell_controller.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

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
                    tag: "Who I Am",
                    title: "About Md: Ahosan Habib Hasan",
                    subtitle: "Flutter App Developer • Full-Stack Web Developer • Graphic Designer • Video Editor • Digital Marketer • SEO • DevOps Learner",
                  ),
                  const SizedBox(height: 48),
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: [
                        _buildSummaryCard(shellController),
                        const SizedBox(height: 32),
                        _buildPrinciplesGrid(),
                        const SizedBox(height: 32),
                        _buildDevOpsRoadmapCard(),
                      ],
                    ),
                    desktop: (context, constraints) => Column(
                      children: [
                        _buildSummaryCard(shellController),
                        const SizedBox(height: 48),
                        _buildPrinciplesGrid(),
                        const SizedBox(height: 48),
                        _buildDevOpsRoadmapCard(),
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

  Widget _buildSummaryCard(ShellController shellController) {
    return GlassCard(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.primaryGradient,
                ),
                child: const CircleAvatar(
                  backgroundColor: AppColors.surfaceDark,
                  child: Icon(Icons.person, color: AppColors.primaryCyan, size: 36),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Md: Ahosan Habib Hasan", style: AppTypography.title2),
                    const SizedBox(height: 4),
                    Text(PortfolioDataProvider.agencyStatus, style: AppTypography.caption.copyWith(color: AppColors.primaryCyan)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text("PROFESSIONAL SUMMARY", style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 8),
          Text(PortfolioDataProvider.bioSummary, style: AppTypography.body1),
          const SizedBox(height: 24),
          Text("WHAT DRIVES ME FORWARD", style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 8),
          Text(
            "To join an innovative software company where I can build high-quality, real-world applications, solve challenging problems through clean code and creative thinking, continuously learn modern technologies, and grow steadily as a full-stack software engineer with expertise spanning mobile, web, and DevOps engineering.",
            style: AppTypography.body1,
          ),
        ],
      ),
    );
  }

  Widget _buildPrinciplesGrid() {
    final principles = [
      {'title': 'Mission', 'icon': Icons.rocket_launch, 'desc': 'To design and build production-grade digital products — mobile applications, web platforms, and creative assets — that solve real problems, delight users, and create measurable value.'},
      {'title': 'Vision', 'icon': Icons.visibility, 'desc': 'To become a highly sought-after, full-spectrum digital engineer recognized internationally for excellence in Flutter mobile development, modern web engineering, and DevOps best practices.'},
      {'title': 'Work Philosophy', 'icon': Icons.lightbulb, 'desc': 'Write clean, maintainable code. Prioritize user experience. Commit to continuous learning. Deliver on time, every time. Technology is only as powerful as the value it creates for people.'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.95,
      ),
      itemCount: principles.length,
      itemBuilder: (context, index) {
        final p = principles[index];
        return GlassCard(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(p['icon'] as IconData, color: AppColors.primaryCyan, size: 32),
              const SizedBox(height: 16),
              Text(p['title'] as String, style: AppTypography.subtitle),
              const SizedBox(height: 10),
              Text(p['desc'] as String, style: AppTypography.body2),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDevOpsRoadmapCard() {
    return GlassCard(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("DevOps Roadmap Progress", style: AppTypography.title2),
          const SizedBox(height: 8),
          Text("Active continuous learning roadmap progress in backend deployment automation and cloud infrastructure.", style: AppTypography.body2),
          const SizedBox(height: 24),
          ...controller.devOpsRoadmap.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.key, style: AppTypography.body1.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.w600)),
                      Text("${entry.value}%", style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: entry.value / 100,
                      minHeight: 8,
                      backgroundColor: AppColors.surfaceDark,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryCyan),
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
}
