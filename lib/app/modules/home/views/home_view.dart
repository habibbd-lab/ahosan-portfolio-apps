import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/testimonial_model.dart';
import '../../../data/providers/portfolio_data_provider.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/glass_card.dart';
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
            // 1. HERO BANNER SECTION
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 64,
                vertical: isMobile ? 40 : 80,
              ),
              child: ResponsiveBuilder(
                mobile: (context, constraints) => Column(
                  children: [
                    _buildHeroBioText(shellController, isMobile: true),
                    const SizedBox(height: 40),
                    _buildHeroProfileVisual(),
                  ],
                ),
                desktop: (context, constraints) => Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildHeroBioText(shellController, isMobile: false),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 5,
                      child: _buildHeroProfileVisual(),
                    ),
                  ],
                ),
              ),
            ),

            // 2. STATS COUNTER SECTION
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 64,
                vertical: 32,
              ),
              child: ResponsiveBuilder(
                mobile: (context, constraints) => Column(
                  children: const [
                    StatCard(number: "15+", label: "Projects Completed"),
                    SizedBox(height: 16),
                    StatCard(number: "6+", label: "Months Agency Exp"),
                    SizedBox(height: 16),
                    StatCard(number: "20+", label: "Technologies & Tools"),
                    SizedBox(height: 16),
                    StatCard(number: "5+", label: "Certificates Earned"),
                    SizedBox(height: 16),
                    StatCard(number: "100%", label: "Learning Journey"),
                  ],
                ),
                tablet: (context, constraints) => GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: const [
                    StatCard(number: "15+", label: "Projects Completed"),
                    StatCard(number: "6+", label: "Months Agency Exp"),
                    StatCard(number: "20+", label: "Technologies & Tools"),
                    StatCard(number: "5+", label: "Certificates Earned"),
                    StatCard(number: "100%", label: "Learning Journey"),
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

            // 3. ABOUT ME PREVIEW SECTION
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 64,
                vertical: 64,
              ),
              child: Column(
                children: [
                  const SectionHeader(
                    tag: "About Me",
                    title: "Turning Ideas into Powerful Digital Experiences",
                    subtitle: PortfolioDataProvider.bioSummary,
                  ),
                  const SizedBox(height: 48),
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: [
                        _buildAboutAttributesCard(),
                        const SizedBox(height: 24),
                        _buildCompetenciesGrid(),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 5, child: _buildAboutAttributesCard()),
                        const SizedBox(width: 32),
                        Expanded(flex: 7, child: _buildCompetenciesGrid()),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 4. FEATURED PROJECTS SECTION
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 64,
                vertical: 64,
              ),
              child: Column(
                children: [
                  const SectionHeader(
                    tag: "My Portfolio",
                    title: "Featured Projects",
                    subtitle: "Explore some of my recent Flutter, Web Development, and Mobile UI applications built with precision.",
                  ),
                  const SizedBox(height: 48),
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: controller.featuredProjects.map((p) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: ProjectCard(
                            project: p,
                            onTap: () => shellController.navigateTo(AppRoutes.PROJECTS),
                          ),
                        );
                      }).toList(),
                    ),
                    tablet: (context, constraints) => GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        childAspectRatio: 0.85,
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
                    desktop: (context, constraints) => GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        childAspectRatio: 0.82,
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
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: "Explore All Projects ->",
                    onPressed: () => shellController.navigateTo(AppRoutes.PROJECTS),
                  ),
                ],
              ),
            ),

            // 5. SERVICES OVERVIEW
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 64,
                vertical: 64,
              ),
              child: Column(
                children: [
                  const SectionHeader(
                    tag: "Services",
                    title: "What I Can Do For You",
                    subtitle: "Providing end-to-end digital solutions spanning mobile app engineering, full-stack web, graphics, video, and AI.",
                  ),
                  const SizedBox(height: 48),
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: controller.services.map((s) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: ServiceCard(
                            service: s,
                            onLearnMore: () => shellController.navigateTo(AppRoutes.SERVICES),
                            onRequest: () => shellController.navigateTo(AppRoutes.CONTACT),
                          ),
                        );
                      }).toList(),
                    ),
                    tablet: (context, constraints) => GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        childAspectRatio: 0.82,
                      ),
                      itemCount: controller.services.length,
                      itemBuilder: (context, index) {
                        final s = controller.services[index];
                        return ServiceCard(
                          service: s,
                          onLearnMore: () => shellController.navigateTo(AppRoutes.SERVICES),
                          onRequest: () => shellController.navigateTo(AppRoutes.CONTACT),
                        );
                      },
                    ),
                    desktop: (context, constraints) => GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        childAspectRatio: 0.78,
                      ),
                      itemCount: controller.services.length,
                      itemBuilder: (context, index) {
                        final s = controller.services[index];
                        return ServiceCard(
                          service: s,
                          onLearnMore: () => shellController.navigateTo(AppRoutes.SERVICES),
                          onRequest: () => shellController.navigateTo(AppRoutes.CONTACT),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 6. TESTIMONIALS SECTION
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 64,
                vertical: 64,
              ),
              child: Column(
                children: [
                  const SectionHeader(
                    tag: "Testimonials",
                    title: "Client & Peer Feedback",
                    subtitle: "Here is what project stakeholders and supervisors say about working with Ahosan Habib Hasan.",
                  ),
                  const SizedBox(height: 48),
                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: controller.testimonials.map((t) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: _buildTestimonialCard(t),
                        );
                      }).toList(),
                    ),
                    desktop: (context, constraints) => Row(
                      children: controller.testimonials.map((t) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: _buildTestimonialCard(t),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // 7. CTA BANNER
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 64,
                vertical: 64,
              ),
              child: GlassCard(
                padding: EdgeInsets.all(isMobile ? 32 : 56),
                child: Column(
                  children: [
                    Text(
                      "Have a Project in Mind?",
                      style: AppTypography.title1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 650),
                      child: Text(
                        "Whether you need a Flutter Mobile App, Web Platform, Graphic Design, or Digital Growth Strategy, let me help you bring your vision to life.",
                        textAlign: TextAlign.center,
                        style: AppTypography.body1,
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

            // GLOBAL FOOTER
            const GlobalFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroBioText(ShellController shellController, {required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryCyan.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primaryCyan.withOpacity(0.3)),
          ),
          child: Text(
            PortfolioDataProvider.agencyStatus,
            style: AppTypography.caption.copyWith(
              color: AppColors.primaryCyan,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "HELLO, I'M",
          style: AppTypography.subtitle.copyWith(
            color: AppColors.primaryCyan,
            letterSpacing: 2,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        ShaderMask(
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
          child: Text(
            PortfolioDataProvider.name,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: AppTypography.heroHeading.copyWith(
              fontSize: isMobile ? 32 : 48,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Specialized in Full Stack Web Developer & Flutter Engineering",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: AppTypography.subtitle.copyWith(
            color: AppColors.textSecondary,
            fontSize: isMobile ? 16 : 20,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          PortfolioDataProvider.bioSummary,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: AppTypography.body1,
        ),
        const SizedBox(height: 32),
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 12,
          runSpacing: 12,
          children: [
            CustomButton(
              text: "Download CV",
              icon: Icons.download,
              onPressed: () => shellController.copyToClipboard(PortfolioDataProvider.email, "Resume Link"),
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
    );
  }

  Widget _buildHeroProfileVisual() {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
              border: Border.all(color: AppColors.primaryCyan, width: 2),
            ),
            child: const CircleAvatar(
              backgroundColor: AppColors.surfaceDark,
              child: Icon(Icons.person, size: 80, color: AppColors.primaryCyan),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            PortfolioDataProvider.name,
            style: AppTypography.subtitle,
          ),
          const SizedBox(height: 4),
          Text(
            PortfolioDataProvider.location,
            style: AppTypography.caption.copyWith(color: AppColors.primaryCyan),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: const [
              _HeroTechNode(label: "Flutter"),
              _HeroTechNode(label: "Dart"),
              _HeroTechNode(label: "GetX"),
              _HeroTechNode(label: "REST API"),
              _HeroTechNode(label: "HTML5"),
              _HeroTechNode(label: "CSS3"),
              _HeroTechNode(label: "JavaScript"),
              _HeroTechNode(label: "Docker"),
              _HeroTechNode(label: "Linux"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutAttributesCard() {
    final attributes = [
      {'label': 'NAME', 'val': PortfolioDataProvider.name},
      {'label': 'LOCATION', 'val': PortfolioDataProvider.location},
      {'label': 'EMAIL', 'val': PortfolioDataProvider.email},
      {'label': 'PHONE', 'val': PortfolioDataProvider.phone},
      {'label': 'EXPERIENCE', 'val': '6+ Months Agency Tenure'},
      {'label': 'EDUCATION', 'val': 'Diploma in CST'},
    ];

    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sincere, Professional & Hardworking Engineer", style: AppTypography.subtitle),
          const SizedBox(height: 16),
          ...attributes.map((attr) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      attr['label']!,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.primaryCyan,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      attr['val']!,
                      style: AppTypography.body2.copyWith(color: AppColors.textPrimary),
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

  Widget _buildCompetenciesGrid() {
    final competencies = [
      {'title': 'Flutter Mobile Engineering', 'desc': 'Cross-platform Android & iOS apps with GetX state management.'},
      {'title': 'Responsive Web Dev', 'desc': 'High-performance web apps built with HTML5, CSS3, JS ES6, and Bootstrap 5.'},
      {'title': 'REST API & Backend Sync', 'desc': 'Asynchronous network requests, JSON parsing, and repository pattern.'},
      {'title': 'Graphic & Brand Design', 'desc': 'Vector logo design, brand asset creation with Photoshop & Illustrator.'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.3,
      ),
      itemCount: competencies.length,
      itemBuilder: (context, index) {
        final c = competencies[index];
        return GlassCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(c['title']!, style: AppTypography.subtitle.copyWith(fontSize: 14)),
              const SizedBox(height: 6),
              Text(c['desc']!, style: AppTypography.body2, maxLines: 3, overflow: TextOverflow.ellipsis),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTestimonialCard(TestimonialModel t) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              t.ratingStars,
              (index) => const Icon(Icons.star, color: AppColors.accentYellow, size: 16),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '"${t.quote}"',
            style: AppTypography.body1.copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primaryCyan.withOpacity(0.2),
                child: Text(
                  t.initials,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primaryCyan,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.authorName, style: AppTypography.subtitle.copyWith(fontSize: 14)),
                  Text(t.authorCompany, style: AppTypography.caption),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroTechNode extends StatelessWidget {
  final String label;

  const _HeroTechNode({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(
          color: AppColors.primaryCyan,
          fontSize: 11,
        ),
      ),
    );
  }
}
