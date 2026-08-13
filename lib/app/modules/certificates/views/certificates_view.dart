import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/portfolio_data_provider.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/certificate_card.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/filter_chip.dart';
import '../../../widgets/glass_card.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/search_bar.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/stat_card.dart';
import '../../shell/controllers/shell_controller.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/certificates_controller.dart';

class CertificatesView extends GetView<CertificatesController> {
  const CertificatesView({super.key});

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
                    tag: "CERTIFICATES & CREDENTIALS",
                    title: "Education, Certifications & Achievements",
                    subtitle:
                        "Showcasing continuous learning, technical growth, professional training courses, verified institutional diplomas, and career milestones.",
                  ),
                  const SizedBox(height: 36),

                  // Header Metrics Grid (6 Metrics)
                  ResponsiveBuilder(
                    mobile: (context, constraints) => GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.35,
                      children: const [
                        StatCard(number: "5", label: "Certificates"),
                        StatCard(number: "6", label: "Courses Taken"),
                        StatCard(number: "20", label: "Skills Mastered"),
                        StatCard(number: "15", label: "Live Projects"),
                        StatCard(number: "500+", label: "Learning Hours"),
                        StatCard(number: "100%", label: "Growth Commitment"),
                      ],
                    ),
                    desktop: (context, constraints) => Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(child: StatCard(number: "5", label: "Certificates")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "6", label: "Courses Taken")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "20", label: "Skills Mastered")),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: const [
                            Expanded(child: StatCard(number: "15", label: "Live Projects")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "500+", label: "Learning Hours")),
                            SizedBox(width: 16),
                            Expanded(child: StatCard(number: "100%", label: "Growth Commitment")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Search Bar & Filter Chips
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: CustomSearchBar(
                      hintText: "Search certificates by institute, course, credential ID, or skill...",
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

                  // Certificate Cards Grid (at least 2 per row)
                  Obx(() {
                    final certs = controller.filteredCertificates;
                    if (certs.isEmpty) {
                      return const EmptyStateWidget(
                        title: "No Credentials Found",
                        message: "No certificate match your search query.",
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
                      itemCount: certs.length,
                      itemBuilder: (context, index) {
                        final c = certs[index];
                        return CertificateCard(
                          certificate: c,
                          onTap: () => controller.showCertificateDetails(c),
                        );
                      },
                    );
                  }),
                  const SizedBox(height: 64),

                  // Mastered Technologies Skills Badges
                  Text(
                    "MASTERED TECHNOLOGIES",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Skills Badges",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Core tools and frameworks verified across official certifications and agency projects.",
                    style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: const [
                      _BadgeChip(label: "Flutter"),
                      _BadgeChip(label: "Dart"),
                      _BadgeChip(label: "GetX"),
                      _BadgeChip(label: "REST API"),
                      _BadgeChip(label: "HTML5"),
                      _BadgeChip(label: "CSS3"),
                      _BadgeChip(label: "Bootstrap 5"),
                      _BadgeChip(label: "JavaScript ES6"),
                      _BadgeChip(label: "Git"),
                      _BadgeChip(label: "GitHub"),
                      _BadgeChip(label: "Photoshop"),
                      _BadgeChip(label: "Illustrator"),
                      _BadgeChip(label: "SEO"),
                      _BadgeChip(label: "Digital Marketing"),
                      _BadgeChip(label: "AI Tools"),
                    ],
                  ),
                  const SizedBox(height: 64),

                  // Future Certifications Section
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
                                color: AppColors.primaryCyan.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.primaryCyan.withOpacity(0.3)),
                              ),
                              child: Text(
                                "CONTINUOUS GROWTH",
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.primaryCyan,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Future Certifications",
                          style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Planned professional certifications currently targeted for completion.",
                          style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                        ),
                        const SizedBox(height: 28),

                        ResponsiveBuilder(
                          mobile: (context, constraints) => Column(
                            children: [
                              _buildPlannedCertCard("AWS Cloud Practitioner", "Amazon Web Services cloud fundamentals & architecture."),
                              const SizedBox(height: 12),
                              _buildPlannedCertCard("Docker Certified Associate", "Container orchestration & Dockerfile optimization."),
                              const SizedBox(height: 12),
                              _buildPlannedCertCard("Kubernetes CKA", "Certified Kubernetes Administrator cluster management."),
                              const SizedBox(height: 12),
                              _buildPlannedCertCard("GitHub Actions Specialist", "Advanced CI/CD workflow automation."),
                              const SizedBox(height: 12),
                              _buildPlannedCertCard("Linux Administration (LPIC-1)", "Linux system architecture & bash CLI."),
                              const SizedBox(height: 12),
                              _buildPlannedCertCard("Google Flutter Advanced", "Advanced architecture, custom platform channels."),
                              const SizedBox(height: 12),
                              _buildPlannedCertCard("Azure Fundamentals (AZ-900)", "Microsoft Azure cloud services & security."),
                              const SizedBox(height: 12),
                              _buildPlannedCertCard("OpenAI API Developer", "Generative AI LLM integration & fine-tuning."),
                            ],
                          ),
                          desktop: (context, constraints) => GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 2.2,
                            children: [
                              _buildPlannedCertCard("AWS Cloud Practitioner", "Amazon Web Services cloud fundamentals & architecture."),
                              _buildPlannedCertCard("Docker Certified Associate", "Container orchestration & Dockerfile optimization."),
                              _buildPlannedCertCard("Kubernetes CKA", "Certified Kubernetes Administrator cluster management."),
                              _buildPlannedCertCard("GitHub Actions Specialist", "Advanced CI/CD workflow automation."),
                              _buildPlannedCertCard("Linux Administration (LPIC-1)", "Linux system architecture & bash CLI."),
                              _buildPlannedCertCard("Google Flutter Advanced", "Advanced architecture, custom platform channels."),
                              _buildPlannedCertCard("Azure Fundamentals (AZ-900)", "Microsoft Azure cloud services & security."),
                              _buildPlannedCertCard("OpenAI API Developer", "Generative AI LLM integration & fine-tuning."),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),

                  // Empowering Innovation CTA Banner
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
                            "LEARNING NEVER STOPS",
                            style: AppTypography.caption.copyWith(
                              color: AppColors.primaryCyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Empowering Innovation Through Continuous Learning",
                          style: AppTypography.title1.copyWith(fontSize: isMobile ? 22 : 32),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 680),
                          child: Text(
                            "Looking for a certified Flutter & Full Stack Web Developer for your team or agency project?",
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
                                          text: "Hire Me",
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                          onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: CustomButton(
                                          text: "Projects",
                                          isOutline: true,
                                          icon: Icons.folder_outlined,
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                          onPressed: () => shellController.navigateTo(AppRoutes.PROJECTS),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          text: "Resume",
                                          isOutline: true,
                                          icon: Icons.download,
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                          onPressed: () => shellController.copyToClipboard(PortfolioDataProvider.email, "Resume"),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: CustomButton(
                                          text: "Contact",
                                          isOutline: true,
                                          icon: Icons.mail_outline,
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
                                    text: "Hire Me",
                                    onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                                  ),
                                  CustomButton(
                                    text: "View Projects",
                                    isOutline: true,
                                    icon: Icons.folder_outlined,
                                    onPressed: () => shellController.navigateTo(AppRoutes.PROJECTS),
                                  ),
                                  CustomButton(
                                    text: "Download Resume",
                                    isOutline: true,
                                    icon: Icons.download,
                                    onPressed: () => shellController.copyToClipboard(PortfolioDataProvider.email, "Resume"),
                                  ),
                                  CustomButton(
                                    text: "Contact Me",
                                    isOutline: true,
                                    icon: Icons.mail_outline,
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

  Widget _buildPlannedCertCard(String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: AppTypography.body2.copyWith(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                const SizedBox(height: 2),
                Text(desc, style: AppTypography.caption, maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.accentYellow.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "PLANNED",
              style: AppTypography.caption.copyWith(color: AppColors.accentYellow, fontWeight: FontWeight.bold, fontSize: 9),
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeChip extends StatelessWidget {
  final String label;

  const _BadgeChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontSize: 12),
      ),
    );
  }
}
