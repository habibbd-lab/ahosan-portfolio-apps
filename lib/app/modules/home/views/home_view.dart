import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/testimonial_model.dart';
import '../../../data/providers/portfolio_data_provider.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/glass_card.dart';
import '../../../widgets/orbital_3d_avatar.dart';
import '../../../widgets/project_card.dart';
import '../../../widgets/responsive_builder.dart';
import '../../../widgets/section_header.dart';
import '../../../widgets/service_card.dart';
import '../../../widgets/stat_card.dart';
import '../../shell/controllers/shell_controller.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final shellController = Get.find<ShellController>();
    final isMobile = ResponsiveBuilder.isMobile(context);

    return ShellView(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // ==========================================
            // 1. 3D HERO BANNER SECTION (Image 2 Left)
            // ==========================================
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 64,
                vertical: isMobile ? 32 : 64,
              ),
              child: ResponsiveBuilder(
                mobile: (context, constraints) => Column(
                  children: [
                    const Orbital3dAvatar(size: 320),
                    const SizedBox(height: 32),
                    _buildHeroBioText(shellController, isMobile: true),
                  ],
                ),
                desktop: (context, constraints) => Row(
                  children: [
                    const Expanded(
                      flex: 5,
                      child: Center(
                        child: Orbital3dAvatar(size: 440),
                      ),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 7,
                      child: _buildHeroBioText(shellController, isMobile: false),
                    ),
                  ],
                ),
              ),
            ),

            // ==========================================
            // 2. PERSONAL VALUES, ETHICS & PASSIONS (Image 1 Left)
            // ==========================================
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 64,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Feature Cards Row (at least 2 per row)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildPortfolioSummaryCard(
                          badgeText: "2024 - 2025",
                          title: "Live Portfolio Projects",
                          description:
                              "Delivered flagship projects including Chef Starz, Worker Hiring, and Artisan business applications.",
                        ),
                      ),
                      SizedBox(width: isMobile ? 12 : 24),
                      Expanded(
                        child: _buildPortfolioSummaryCard(
                          badgeText: "PRESENT",
                          title: "DevOps Roadmap & Continuous Learning",
                          description:
                              "Actively mastering Linux, Docker, CI/CD automation, and AI-driven software development workflows.",
                          badgeColor: AppColors.accentGreen,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Personal Values & Work Ethics
                  _buildChipsSection(
                    icon: Icons.favorite,
                    iconColor: Colors.redAccent,
                    title: "Personal Values & Work Ethics",
                    chips: const [
                      "💡 Innovation",
                      "⚡ Clean Code",
                      "🎨 Creativity",
                      "🌱 Continuous Learning",
                      "🧩 Problem Solving",
                      "🤝 Teamwork",
                      "🛡️ Professional Ethics",
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Interests & Passions
                  _buildChipsSection(
                    icon: Icons.track_changes,
                    iconColor: AppColors.primaryCyan,
                    title: "Interests & Passions",
                    chips: const [
                      "🌐 Technology",
                      "💻 Open Source",
                      "📱 Mobile Apps",
                      "🎨 UI/UX Design",
                      "🤖 Artificial Intelligence",
                      "☁️ Cloud Computing",
                      "📷 Photography",
                      "✨ Creative Design",
                    ],
                  ),
                  const SizedBox(height: 36),

                  // Quick Navigation Buttons
                  isMobile
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    text: "Read Bio",
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                    onPressed: () => shellController.navigateTo(AppRoutes.ABOUT),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: CustomButton(
                                    text: "Tech Stack",
                                    isOutline: true,
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                                    onPressed: () => shellController.navigateTo(AppRoutes.SKILLS),
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
                                    text: "Hire Me",
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
                          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                          children: [
                            CustomButton(
                              text: "Read Full Bio",
                              onPressed: () => shellController.navigateTo(AppRoutes.ABOUT),
                            ),
                            CustomButton(
                              text: "Explore Tech Stack",
                              isOutline: true,
                              onPressed: () => shellController.navigateTo(AppRoutes.SKILLS),
                            ),
                            CustomButton(
                              text: "View Projects",
                              isOutline: true,
                              icon: Icons.folder_outlined,
                              onPressed: () => shellController.navigateTo(AppRoutes.PROJECTS),
                            ),
                            CustomButton(
                              text: "Hire Me",
                              isOutline: true,
                              icon: Icons.mail_outline,
                              onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                            ),
                          ],
                        ),
                ],
              ),
            ),

            // ==========================================
            // 3. STATS COUNTER SECTION (Image 2)
            // ==========================================
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 64,
                vertical: 24,
              ),
              child: ResponsiveBuilder(
                mobile: (context, constraints) => GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: isMobile ? 1.05 : 1.35,
                  children: const [
                    StatCard(number: "15+", label: "Projects Completed"),
                    StatCard(number: "6+", label: "Months Agency Exp"),
                    StatCard(number: "20+", label: "Technologies & Tools"),
                    StatCard(number: "5+", label: "Certificates Earned"),
                  ],
                ),
                desktop: (context, constraints) => Row(
                  children: const [
                    Expanded(child: StatCard(number: "15+", label: "Projects Completed")),
                    SizedBox(width: 16),
                    Expanded(child: StatCard(number: "6+", label: "Months Agency Exp")),
                    SizedBox(width: 16),
                    Expanded(child: StatCard(number: "20+", label: "Technologies & Tools")),
                    SizedBox(width: 16),
                    Expanded(child: StatCard(number: "5+", label: "Certificates Earned")),
                    SizedBox(width: 16),
                    Expanded(child: StatCard(number: "100%", label: "Learning Journey")),
                  ],
                ),
              ),
            ),

            // ==========================================
            // 4. ABOUT ME & PROFILE SPOTLIGHT
            // ==========================================
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 64,
                vertical: 56,
              ),
              child: Column(
                children: [
                  const SectionHeader(
                    tag: "ABOUT ME",
                    title: "Turning Ideas into Powerful Digital Experiences",
                    subtitle:
                        "Agency-proven Flutter Developer, Full Stack Web Engineer, Creative Graphic Designer, and DevOps Learner focused on crafting scalable, high-performance software.",
                  ),
                  const SizedBox(height: 48),
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: [
                        _buildProfileSpotlightCard(shellController),
                        const SizedBox(height: 24),
                        _buildAboutBioAndAttributes(),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: _buildProfileSpotlightCard(shellController),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 7,
                          child: _buildAboutBioAndAttributes(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Professional Highlights Grid & Career Timeline
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: [
                        _buildCompetenciesGrid(),
                        const SizedBox(height: 32),
                        _buildCareerTimelinePreview(shellController),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 7, child: _buildCompetenciesGrid()),
                        const SizedBox(width: 32),
                        Expanded(flex: 5, child: _buildCareerTimelinePreview(shellController)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ==========================================
            // 5. FEATURED PROJECTS SECTION (Image 4)
            // ==========================================
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 64,
                vertical: 56,
              ),
              child: Column(
                children: [
                  const SectionHeader(
                    tag: "MY PORTFOLIO",
                    title: "Featured Projects",
                    subtitle:
                        "Explore some of my recent Flutter, Web Development, and Mobile UI applications built with precision.",
                  ),
                  const SizedBox(height: 36),

                  // Workspace Preview Image Banner
                  GlassCard(
                    padding: EdgeInsets.all(isMobile ? 12 : 20),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: AspectRatio(
                            aspectRatio: isMobile ? 1.4 : 2.2,
                            child: Container(
                              color: AppColors.surfaceDark,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.developer_board,
                                    size: 80,
                                    color: AppColors.primaryCyan.withOpacity(0.4),
                                  ),
                                  Positioned(
                                    bottom: 16,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: AppColors.background.withOpacity(0.85),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: AppColors.glassBorder),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                           Icon(Icons.touch_app,
                                              size: 14, color: AppColors.primaryCyan),
                                          const SizedBox(width: 6),
                                          Text(
                                            "Cross-Platform App Prototyping & Wireframing",
                                            style: AppTypography.caption.copyWith(
                                              color: AppColors.textPrimary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Project Cards (at least 2 per row)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 2 : 3,
                      crossAxisSpacing: isMobile ? 12 : 24,
                      mainAxisSpacing: isMobile ? 12 : 24,
                      childAspectRatio: isMobile ? 0.72 : 0.82,
                    ),
                    itemCount: controller.featuredProjects.length,
                    itemBuilder: (context, index) {
                      final p = controller.featuredProjects[index];
                      return ProjectCard(
                        project: p,
                        onTap: () => shellController.navigateTo(AppRoutes.PROJECTS),
                      );
                    },
                  ),
                  const SizedBox(height: 36),
                  CustomButton(
                    text: "Explore All Projects ->",
                    onPressed: () => shellController.navigateTo(AppRoutes.PROJECTS),
                  ),
                ],
              ),
            ),

            // ==========================================
            // 6. SERVICES OVERVIEW SECTION (Image 5)
            // ==========================================
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 64,
                vertical: 56,
              ),
              child: Column(
                children: [
                  const SectionHeader(
                    tag: "SERVICES",
                    title: "What I Can Do For You",
                    subtitle:
                        "Providing end-to-end digital solutions spanning mobile app engineering, full-stack web, graphics, video, and AI.",
                  ),
                  const SizedBox(height: 48),
                  if (isMobile)
                    Column(
                      children: controller.services.take(4).map((s) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ServiceCard(
                            service: s,
                            onLearnMore: () => shellController.navigateTo(AppRoutes.SERVICES),
                            onRequest: () => shellController.navigateTo(AppRoutes.CONTACT),
                          ),
                        );
                      }).toList(),
                    )
                  else
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: controller.services.length.clamp(0, 6),
                      itemBuilder: (context, index) {
                        final s = controller.services[index];
                        return ServiceCard(
                          service: s,
                          onLearnMore: () => shellController.navigateTo(AppRoutes.SERVICES),
                          onRequest: () => shellController.navigateTo(AppRoutes.CONTACT),
                        );
                      },
                    ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: "View All 15 Services ->",
                    onPressed: () => shellController.navigateTo(AppRoutes.SERVICES),
                  ),
                ],
              ),
            ),

            // ==========================================
            // 7. TESTIMONIALS SECTION
            // ==========================================
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 64,
                vertical: 56,
              ),
              child: Column(
                children: [
                  const SectionHeader(
                    tag: "TESTIMONIALS",
                    title: "Client & Peer Feedback",
                    subtitle:
                        "Here is what project stakeholders and supervisors say about working with Ahosan Habib Hasan.",
                  ),
                  const SizedBox(height: 48),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 2 : 3,
                      crossAxisSpacing: isMobile ? 12 : 24,
                      mainAxisSpacing: isMobile ? 12 : 24,
                      childAspectRatio: isMobile ? 0.72 : 1.1,
                    ),
                    itemCount: controller.testimonials.length,
                    itemBuilder: (context, index) {
                      final t = controller.testimonials[index];
                      return _buildTestimonialCard(t);
                    },
                  ),
                ],
              ),
            ),

            // ==========================================
            // 8. CTA BANNER (Image 3 Left)
            // ==========================================
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 64,
                vertical: 56,
              ),
              child: GlassCard(
                padding: EdgeInsets.all(isMobile ? 28 : 56),
                child: Column(
                  children: [
                    Text(
                      "Have a Project in Mind?",
                      style: AppTypography.title1.copyWith(
                        fontSize: isMobile ? 24 : 36,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 14),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 650),
                      child: Text(
                        "Whether you need a Flutter Mobile App, Web Platform, Graphic Design, or Digital Growth Strategy, let me help you bring your vision to life.",
                        textAlign: TextAlign.center,
                        style: AppTypography.body1.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      text: "Get In Touch Now",
                      onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                    ),
                  ],
                ),
              ),
            ),

            // GLOBAL FOOTER (Image 3 Right)
            const GlobalFooter(),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // HELPER WIDGET BUILDERS
  // ==========================================

  Widget _buildHeroBioText(ShellController shellController, {required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Agency Tenure Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryCyan.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primaryCyan.withOpacity(0.4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.bolt, size: 14, color: AppColors.primaryCyan),
              const SizedBox(width: 4),
              Text(
                PortfolioDataProvider.agencyStatus,
                style: AppTypography.caption.copyWith(
                  color: AppColors.primaryCyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "HELLO, I'M",
          style: AppTypography.subtitle.copyWith(
            color: AppColors.primaryCyan,
            letterSpacing: 2.5,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),

        // Name with Shader Mask
        ShaderMask(
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
          child: Text(
            PortfolioDataProvider.name,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: AppTypography.heroHeading.copyWith(
              fontSize: isMobile ? 30 : 46,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Specialized in Full Stack Web Developer & Flutter Engineering",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: AppTypography.subtitle.copyWith(
            color: AppColors.textSecondary,
            fontSize: isMobile ? 15 : 19,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          PortfolioDataProvider.bioSummary,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: AppTypography.body1.copyWith(
            height: 1.6,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 32),

        // Action Buttons Row (Download CV, View CV, Print CV, Hire Me, Contact Me)
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: [
            CustomButton(
              text: "Download CV",
              icon: Icons.download,
              onPressed: () => shellController.copyToClipboard(PortfolioDataProvider.email, "Resume Link"),
            ),
            CustomButton(
              text: "View CV",
              isOutline: true,
              icon: Icons.visibility_outlined,
              onPressed: () => shellController.navigateTo(AppRoutes.ABOUT),
            ),
            CustomButton(
              text: "Print CV",
              isOutline: true,
              icon: Icons.print_outlined,
              onPressed: () => shellController.copyToClipboard(PortfolioDataProvider.email, "CV Link"),
            ),
            CustomButton(
              text: "Hire Me",
              isOutline: true,
              icon: Icons.work_outline,
              onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
            ),
            CustomButton(
              text: "Contact Me",
              isOutline: true,
              icon: Icons.chat_bubble_outline,
              onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Direct Social Channels
        Row(
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Text("Direct Channels: ", style: AppTypography.caption.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            _buildSocialIconButton(Icons.code, () => shellController.launchURL(PortfolioDataProvider.githubUrl)),
            const SizedBox(width: 8),
            _buildSocialIconButton(Icons.business, () => shellController.launchURL(PortfolioDataProvider.linkedinUrl)),
            const SizedBox(width: 8),
            _buildSocialIconButton(Icons.email_outlined, () => shellController.launchURL(PortfolioDataProvider.emailUrl)),
            const SizedBox(width: 8),
            _buildSocialIconButton(Icons.phone_outlined, () => shellController.launchURL(PortfolioDataProvider.phoneUrl)),
            const SizedBox(width: 8),
            _buildSocialIconButton(Icons.chat, () => shellController.launchURL(PortfolioDataProvider.whatsappUrl)),
          ],
        ),
      ],
    );
  }

  Widget _buildPortfolioSummaryCard({
    required String badgeText,
    required String title,
    required String description,
    Color? badgeColor,
  }) {
    final effectiveBadgeColor = badgeColor ?? AppColors.primaryCyan;
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: effectiveBadgeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: effectiveBadgeColor.withOpacity(0.4)),
            ),
            child: Text(
              badgeText,
              style: AppTypography.caption.copyWith(
                color: effectiveBadgeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(title, style: AppTypography.subtitle.copyWith(fontSize: 16)),
          const SizedBox(height: 8),
          Text(description, style: AppTypography.body2),
        ],
      ),
    );
  }

  Widget _buildChipsSection({
    required IconData icon,
    required Color iconColor,
    required String title,
    required List<String> chips,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 8),
            Text(title, style: AppTypography.subtitle.copyWith(fontSize: 17)),
          ],
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: chips.map((chipText) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surfaceDark,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Text(
                chipText,
                style: AppTypography.caption.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildProfileSpotlightCard(ShellController shellController) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Circular Profile Frame
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
              border: Border.all(color: AppColors.primaryCyan, width: 2),
            ),
            child: CircleAvatar(
              backgroundColor: AppColors.surfaceDark,
              radius: 35,
              backgroundImage: AssetImage('assets/my-photo/MD Ahosan Habib.jpeg'),
            )
          ),
          const SizedBox(height: 16),
          Text(
            PortfolioDataProvider.name,
            style: AppTypography.subtitle.copyWith(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            PortfolioDataProvider.title,
            style: AppTypography.body2.copyWith(color: AppColors.primaryCyan),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, size: 14, color: AppColors.textMuted),
              const SizedBox(width: 4),
              Text(
                PortfolioDataProvider.location,
                style: AppTypography.caption,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Badges
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              _buildBadgePill("6 Months Agency Exp", AppColors.primaryCyan),
              _buildBadgePill("Sparktech Agency", AppColors.electricBlue),
            ],
          ),
          const SizedBox(height: 16),

          // Status Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.accentGreen.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.accentGreen.withOpacity(0.4)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.accentGreen,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    "Current Status: Open to Remote & On-Site Roles",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.accentGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Availability Checkmark Pills
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: const [
              _CheckmarkPill(label: "Available for Full-Time"),
              _CheckmarkPill(label: "Available for Remote"),
              _CheckmarkPill(label: "Available Anywhere in BD"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutBioAndAttributes() {
    final attributes = [
      {'label': 'NAME', 'val': PortfolioDataProvider.name},
      {'label': 'LOCATION', 'val': PortfolioDataProvider.location},
      {'label': 'EMAIL', 'val': PortfolioDataProvider.email},
      {'label': 'PHONE', 'val': PortfolioDataProvider.phone},
      {'label': 'EXPERIENCE', 'val': '6+ Months Agency Tenure'},
      {'label': 'LANGUAGES', 'val': 'English, Bengali'},
      {'label': 'EDUCATION', 'val': 'Diploma in CST'},
      {'label': 'FOCUS', 'val': 'DevOps & AI'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sincere, Professional & Hardworking Engineer",
          style: AppTypography.subtitle.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 12),
        Text(
          "I am Md: Ahosan Habib Hasan, a dedicated Flutter App Developer with 6 months of agency experience at Sparktech Agency (Betopa Group). I aim to build up my career through sincerity, professionalism, and hard work by contributing to real-world projects.",
          style: AppTypography.body1.copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(height: 24),

        // Personal Attributes Cards Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.2,
          ),
          itemCount: attributes.length,
          itemBuilder: (context, index) {
            final attr = attributes[index];
            return GlassCard(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    attr['label']!,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    attr['val']!,
                    style: AppTypography.body2.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCompetenciesGrid() {
    final competencies = [
      {
        'title': 'Flutter Mobile Engineering',
        'desc': 'Cross-platform Android & iOS apps with GetX state management & REST API clean architecture.',
        'icon': Icons.phone_android,
      },
      {
        'title': 'Responsive Web Development',
        'desc': 'High-performance web apps built with HTML5, CSS3, JavaScript ES6+, and Bootstrap 5.',
        'icon': Icons.code,
      },
      {
        'title': 'REST API & Backend Sync',
        'desc': 'Asynchronous network requests, JSON parsing, error handling & secure data persistence.',
        'icon': Icons.sync,
      },
      {
        'title': 'Graphic & Brand Design',
        'desc': 'Creative visual design, logos, vector illustration, and brand asset creation with Photoshop & Illustrator.',
        'icon': Icons.brush,
      },
      {
        'title': 'Digital Marketing & SEO',
        'desc': 'Technical SEO administration, organic keyword strategy, and conversion-focused content planning.',
        'icon': Icons.trending_up,
      },
      {
        'title': 'AI Content Creation',
        'desc': 'Generative AI tools, prompt engineering, media production, and intelligent workflow automation.',
        'icon': Icons.smart_toy,
      },
      {
        'title': 'DevOps & Cloud Infrastructure',
        'desc': 'Linux system administration, Docker containerization, NGINX reverse proxies, and GitHub Actions CI/CD pipelines.',
        'icon': Icons.cloud,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "⭐ Professional Highlights",
          style: AppTypography.subtitle.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.45,
          ),
          itemCount: competencies.length,
          itemBuilder: (context, index) {
            final c = competencies[index];
            return GlassCard(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(c['icon'] as IconData, size: 22, color: AppColors.primaryCyan),
                  const SizedBox(height: 6),
                  Text(
                    c['title'] as String,
                    style: AppTypography.subtitle.copyWith(fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    c['desc'] as String,
                    style: AppTypography.caption,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCareerTimelinePreview(ShellController shellController) {
    final timelineItems = [
      {'year': '2022', 'title': 'Graphic Design Foundation', 'desc': 'Mastered Adobe Photoshop & Illustrator, brand identity design.'},
      {'year': '2023', 'title': 'Full Stack Web Development', 'desc': 'Expanded into modern web stack (HTML5, CSS3, JS ES6, Bootstrap 5).'},
      {'year': '2023', 'title': 'Flutter Mobile Development', 'desc': 'Specialized in Dart, Flutter SDK, state management (GetX), and UI.'},
      {'year': '2024', 'title': 'Professional Agency Experience (6 Months)', 'desc': 'Joined Sparktech Agency as a Flutter App Developer.'},
      {'year': '2024-2025', 'title': 'Live Portfolio Projects', 'desc': 'Delivered flagship projects including Chef Starz, Worker Hiring, Artisan.'},
      {'year': 'PRESENT', 'title': 'DevOps Roadmap & Continuous Learning', 'desc': 'Mastering Linux, Docker, CI/CD, and AI-driven workflows.'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.timeline, color: AppColors.primaryCyan, size: 20),
            const SizedBox(width: 8),
            Text(
              "Career Timeline & Experience",
              style: AppTypography.subtitle.copyWith(fontSize: 18),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          itemCount: timelineItems.length,
          itemBuilder: (context, index) {
            final item = timelineItems[index];
            final isPresent = item['year'] == 'PRESENT';
            return GlassCard(
              padding: const EdgeInsets.all(10),
              borderColor: isPresent ? AppColors.accentGreen.withOpacity(0.5) : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: isPresent
                          ? AppColors.accentGreen.withOpacity(0.2)
                          : AppColors.primaryCyan.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      item['year']!,
                      style: AppTypography.caption.copyWith(
                        color: isPresent ? AppColors.accentGreen : AppColors.primaryCyan,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['title']!,
                    style: AppTypography.subtitle.copyWith(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item['desc']!,
                    style: AppTypography.caption.copyWith(fontSize: 10),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTestimonialCard(TestimonialModel t) {
    return GlassCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              t.ratingStars,
              (index) => const Icon(Icons.star, color: AppColors.accentYellow, size: 14),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '"${t.quote}"',
            style: AppTypography.body2.copyWith(
              fontStyle: FontStyle.italic,
              fontSize: 11,
              height: 1.4,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          const SizedBox(height: 8),
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: AppColors.primaryCyan.withOpacity(0.2),
                child: Text(
                  t.initials,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primaryCyan,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.authorName,
                      style: AppTypography.subtitle.copyWith(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      t.authorCompany,
                      style: AppTypography.caption.copyWith(fontSize: 10),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIconButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.glassBorder),
        ),
        child: Icon(icon, size: 16, color: AppColors.primaryCyan),
      ),
    );
  }

  Widget _buildBadgePill(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _CheckmarkPill extends StatelessWidget {
  final String label;

  const _CheckmarkPill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle_outline, size: 12, color: AppColors.primaryCyan),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
