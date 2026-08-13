import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/portfolio_data_provider.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/custom_button.dart';
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
                horizontal: isMobile ? 20 : 64,
                vertical: isMobile ? 32 : 56,
              ),
              child: Column(
                children: [
                  // Header
                  const SectionHeader(
                    tag: "WHO I AM",
                    title: "About Md: Ahosan Habib Hasan",
                    subtitle:
                        "Flutter App Developer • Full-Stack Web Developer • Graphic Designer • Video Editor • Digital Marketer • SEO • DevOps Learner",
                  ),
                  const SizedBox(height: 36),

                  // Avatar & Quick Links Row
                  Column(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.primaryGradient,
                          border: Border.all(color: AppColors.primaryCyan, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryCyan.withOpacity(0.3),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: AppColors.surfaceDark,
                          radius: 35,
                          backgroundImage: AssetImage('assets/my-photo/MD Ahosan Habib.jpeg'),
                        )
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          CustomButton(
                            text: "GitHub (hasan1h2)",
                            icon: Icons.code,
                            isSecondary: true,
                            onPressed: () => shellController.launchURL(PortfolioDataProvider.github),
                          ),
                          CustomButton(
                            text: "Download CV",
                            icon: Icons.download,
                            onPressed: () => shellController.copyToClipboard(PortfolioDataProvider.email, "Resume"),
                          ),
                          CustomButton(
                            text: "View CV",
                            isOutline: true,
                            icon: Icons.visibility_outlined,
                            onPressed: () => shellController.navigateTo(AppRoutes.ABOUT),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // 1. PROFESSIONAL SUMMARY
                  GlassCard(
                    padding: EdgeInsets.all(isMobile ? 24 : 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PROFESSIONAL SUMMARY",
                          style: AppTypography.caption.copyWith(
                            color: AppColors.primaryCyan,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Sincere & Driven Software Engineer",
                          style: AppTypography.title2.copyWith(
                            fontSize: isMobile ? 20 : 26,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Md: Ahosan Habib Hasan is a dedicated Flutter App Developer with 6 months of agency experience at Sparktech Agency (Betopa Group), specializing in cross-platform mobile apps (Dart, Flutter, GetX, REST APIs), responsive web engineering, graphic design, video editing, and DevOps infrastructure. He combines clean mobile UI architecture with modern web design standards and continuous learning in DevOps (Linux, Docker, CI/CD pipelines). His goal is to contribute effectively to real-world software solutions and deliver exceptional value.",
                          style: AppTypography.body1.copyWith(
                            height: 1.6,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 28),

                        // Attributes Grid
                        ResponsiveBuilder(
                          mobile: (context, constraints) => Column(
                            children: [
                              _buildAttrTile("Full Name", PortfolioDataProvider.name, Icons.person_outline),
                              const SizedBox(height: 12),
                              _buildAttrTile("Primary Role", "Flutter App Developer (6 Mos Agency)", Icons.work_outline),
                              const SizedBox(height: 12),
                              _buildAttrTile("Location", PortfolioDataProvider.location, Icons.location_on_outlined),
                              const SizedBox(height: 12),
                              _buildAttrTile("Languages", "Bengali (Native), English (Good)", Icons.language),
                              const SizedBox(height: 12),
                              _buildAttrTile("Email", PortfolioDataProvider.email, Icons.email_outlined),
                              const SizedBox(height: 12),
                              _buildAttrTile("Phone / WhatsApp", PortfolioDataProvider.phone, Icons.phone_outlined),
                            ],
                          ),
                          desktop: (context, constraints) => Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    _buildAttrTile("Full Name", PortfolioDataProvider.name, Icons.person_outline),
                                    const SizedBox(height: 12),
                                    _buildAttrTile("Location", PortfolioDataProvider.location, Icons.location_on_outlined),
                                    const SizedBox(height: 12),
                                    _buildAttrTile("Email", PortfolioDataProvider.email, Icons.email_outlined),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  children: [
                                    _buildAttrTile("Primary Role", "Flutter App Developer (6 Mos Agency)", Icons.work_outline),
                                    const SizedBox(height: 12),
                                    _buildAttrTile("Languages", "Bengali (Native), English (Good)", Icons.language),
                                    const SizedBox(height: 12),
                                    _buildAttrTile("Phone / WhatsApp", PortfolioDataProvider.phone, Icons.phone_outlined),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),

                  // 2. CAREER OBJECTIVE
                  GlassCard(
                    padding: EdgeInsets.all(isMobile ? 24 : 36),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryCyan.withOpacity(0.12),
                            border: Border.all(color: AppColors.primaryCyan.withOpacity(0.3)),
                          ),
                          child: Icon(Icons.track_changes, color: AppColors.primaryCyan, size: 28),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "CAREER OBJECTIVE",
                          style: AppTypography.caption.copyWith(
                            color: AppColors.primaryCyan,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "What Drives Me Forward",
                          style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 750),
                          child: Text(
                            "To join an innovative software company where I can build high-quality, real-world applications, solve challenging problems through clean code and creative thinking, continuously learn modern technologies, and grow steadily as a full-stack software engineer with expertise spanning mobile, web, and DevOps engineering.",
                            textAlign: TextAlign.center,
                            style: AppTypography.body1.copyWith(
                              height: 1.6,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),

                  // 3. MISSION, VISION & WORK PHILOSOPHY
                  Column(
                    children: [
                      Text(
                        "PRINCIPLES",
                        style: AppTypography.caption.copyWith(
                          color: AppColors.primaryCyan,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Mission, Vision & Work Philosophy",
                        style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      ResponsiveBuilder(
                        mobile: (context, constraints) => Column(
                          children: [
                            _buildPrincipleCard("Mission", Icons.rocket_launch, "To design and build production-grade digital products — mobile applications, web platforms, and creative assets that solve real problems, delight users, and create measurable value for businesses and communities."),
                            const SizedBox(height: 20),
                            _buildPrincipleCard("Vision", Icons.visibility, "To become a highly sought-after, full-spectrum digital engineer recognized internationally for excellence in Flutter mobile development, modern web engineering, DevOps best practices, and creative design innovation."),
                            const SizedBox(height: 20),
                            _buildPrincipleCard("Work Philosophy", Icons.lightbulb, "Write clean, maintainable code. Prioritize user experience. Commit to continuous learning. Deliver on time, every time. Seek feedback actively and improve relentlessly. Technology is only as powerful as the value it creates for people."),
                          ],
                        ),
                        desktop: (context, constraints) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildPrincipleCard("Mission", Icons.rocket_launch, "To design and build production-grade digital products — mobile applications, web platforms, and creative assets that solve real problems, delight users, and create measurable value for businesses and communities.")),
                            const SizedBox(width: 20),
                            Expanded(child: _buildPrincipleCard("Vision", Icons.visibility, "To become a highly sought-after, full-spectrum digital engineer recognized internationally for excellence in Flutter mobile development, modern web engineering, DevOps best practices, and creative design innovation.")),
                            const SizedBox(width: 20),
                            Expanded(child: _buildPrincipleCard("Work Philosophy", Icons.lightbulb, "Write clean, maintainable code. Prioritize user experience. Commit to continuous learning. Deliver on time, every time. Seek feedback actively and improve relentlessly. Technology is only as powerful as the value it creates for people.")),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 56),

                  // 4. PROFESSIONAL INTERESTS
                  Column(
                    children: [
                      Text(
                        "PROFESSIONAL INTERESTS",
                        style: AppTypography.caption.copyWith(
                          color: AppColors.primaryCyan,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "What I Love Working On",
                        style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      ResponsiveBuilder(
                        mobile: (context, constraints) => Column(
                          children: [
                            _buildInterestCard("Flutter App Development", Icons.phone_android, "Building cross-platform mobile apps with beautiful UI, GetX state management, and REST API integrations."),
                            const SizedBox(height: 16),
                            _buildInterestCard("Full Stack Web Development", Icons.code, "Creating responsive, SEO-optimized web applications with HTML5, CSS3, Bootstrap 5, and JavaScript ES6."),
                            const SizedBox(height: 16),
                            _buildInterestCard("Graphic & Brand Design", Icons.palette, "Designing brand identities, marketing materials, and visual content using Adobe Photoshop and Illustrator."),
                            const SizedBox(height: 16),
                            _buildInterestCard("AI Content Creation", Icons.smart_toy, "Leveraging AI tools for image generation, video production, and intelligent workflow automation."),
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
                            _buildInterestCard("Flutter App Development", Icons.phone_android, "Building cross-platform mobile apps with beautiful UI, GetX state management, and REST API integrations."),
                            _buildInterestCard("Full Stack Web Development", Icons.code, "Creating responsive, SEO-optimized web applications with HTML5, CSS3, Bootstrap 5, and JavaScript ES6."),
                            _buildInterestCard("Graphic & Brand Design", Icons.palette, "Designing brand identities, marketing materials, and visual content using Adobe Photoshop and Illustrator."),
                            _buildInterestCard("AI Content Creation", Icons.smart_toy, "Leveraging AI tools for image generation, video production, and intelligent workflow automation."),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 56),

                  // 5. DEVOPS ROADMAP PROGRESS
                  GlassCard(
                    padding: EdgeInsets.all(isMobile ? 24 : 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CURRENT LEARNING",
                          style: AppTypography.caption.copyWith(
                            color: AppColors.primaryCyan,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "DevOps Roadmap Progress",
                          style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                        ),
                        const SizedBox(height: 24),
                        ResponsiveBuilder(
                          mobile: (context, constraints) => Column(
                            children: [
                              _buildDevOpsProgressTile("Linux Admin", 70),
                              const SizedBox(height: 16),
                              _buildDevOpsProgressTile("Docker & Containers", 55),
                              const SizedBox(height: 16),
                              _buildDevOpsProgressTile("GitHub Actions", 50),
                              const SizedBox(height: 16),
                              _buildDevOpsProgressTile("NGINX & SSL", 45),
                              const SizedBox(height: 16),
                              _buildDevOpsProgressTile("Cloud Basics & VPS", 40),
                            ],
                          ),
                          desktop: (context, constraints) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    _buildDevOpsProgressTile("Linux Admin", 70),
                                    const SizedBox(height: 16),
                                    _buildDevOpsProgressTile("Docker & Containers", 55),
                                    const SizedBox(height: 16),
                                    _buildDevOpsProgressTile("GitHub Actions", 50),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                child: Column(
                                  children: [
                                    _buildDevOpsProgressTile("NGINX & SSL", 45),
                                    const SizedBox(height: 16),
                                    _buildDevOpsProgressTile("Cloud Basics & VPS", 40),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 56),

                  // 6. READY TO COLLABORATE CTA
                  GlassCard(
                    padding: EdgeInsets.all(isMobile ? 28 : 48),
                    child: Column(
                      children: [
                        Text(
                          "Ready to Collaborate?",
                          style: AppTypography.title1.copyWith(fontSize: isMobile ? 24 : 32),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 650),
                          child: Text(
                            "Whether you need a Flutter app, a responsive website, creative design work, or digital marketing strategy — I am available for freelance contracts and full-time opportunities.",
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
                              text: "Let's Talk",
                              onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                            ),
                            CustomButton(
                              text: "View My Work",
                              isOutline: true,
                              icon: Icons.folder_outlined,
                              onPressed: () => shellController.navigateTo(AppRoutes.PROJECTS),
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

  Widget _buildAttrTile(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.primaryCyan),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.caption.copyWith(color: AppColors.textMuted, fontSize: 11)),
                const SizedBox(height: 2),
                Text(value, style: AppTypography.body2.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrincipleCard(String title, IconData icon, String description) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryCyan.withOpacity(0.12),
            ),
            child: Icon(icon, color: AppColors.primaryCyan, size: 24),
          ),
          const SizedBox(height: 16),
          Text(title, style: AppTypography.subtitle.copyWith(fontSize: 18), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Text(description, style: AppTypography.body2.copyWith(color: AppColors.textSecondary, height: 1.5), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildInterestCard(String title, IconData icon, String description) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primaryCyan.withOpacity(0.12),
            ),
            child: Icon(icon, color: AppColors.primaryCyan, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.subtitle.copyWith(fontSize: 16)),
                const SizedBox(height: 6),
                Text(description, style: AppTypography.body2.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDevOpsProgressTile(String label, int percentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTypography.body2.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
            Text("$percentage%", style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: percentage / 100,
            minHeight: 8,
            backgroundColor: AppColors.surfaceDark,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryCyan),
          ),
        ),
      ],
    );
  }
}
