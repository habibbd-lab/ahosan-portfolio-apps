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
import '../../../widgets/service_card.dart';
import '../../shell/controllers/shell_controller.dart';
import '../../shell/views/shell_view.dart';
import '../../shell/widgets/global_footer.dart';
import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({super.key});

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
                  // 1. Header & 9 Service Cards Grid
                  const SectionHeader(
                    tag: "MY SERVICES",
                    title: "Professional Digital Solutions",
                    subtitle:
                        "Helping businesses, startups, and individuals build modern applications, websites, digital brands, and AI-powered solutions with agency-level quality.",
                  ),
                  const SizedBox(height: 48),

                  if (isMobile)
                    Column(
                      children: controller.services.map((s) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ServiceCard(
                            service: s,
                            onLearnMore: () => controller.showServiceDetails(s),
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
                      itemCount: controller.services.length,
                      itemBuilder: (context, index) {
                        final s = controller.services[index];
                        return ServiceCard(
                          service: s,
                          onLearnMore: () => controller.showServiceDetails(s),
                          onRequest: () => shellController.navigateTo(AppRoutes.CONTACT),
                        );
                      },
                    ),
                  const SizedBox(height: 64),

                  // 2. Why Choose Habib Hasan Section
                  Text(
                    "VALUE PROPOSITION",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Why Choose Habib Hasan",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Combining agency-proven technical expertise, clean code practices, and creative design thinking.",
                    style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: isMobile ? 1.25 : 1.35,
                      children: [
                        _buildValueCard("Professional Communication", "Transparent updates and active collaboration.", Icons.chat_bubble_outline),
                        _buildValueCard("Clean Code", "Maintainable, well-structured codebase.", Icons.code),
                        _buildValueCard("Modern Design", "Futuristic dark glassmorphism & smooth UI.", Icons.brush),
                        _buildValueCard("Responsive Development", "Flawless display on mobile, tablet & desktop.", Icons.devices),
                        _buildValueCard("Creative Thinking", "Innovative solution design tailored to needs.", Icons.lightbulb_outline),
                        _buildValueCard("Fast Delivery", "On-time milestone delivery.", Icons.bolt),
                        _buildValueCard("Continuous Learning", "Updating skills with DevOps & AI.", Icons.school_outlined),
                        _buildValueCard("Reliable Support", "Dedicated post-launch technical assistance.", Icons.headset_mic_outlined),
                      ],
                    ),
                    desktop: (context, constraints) => GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.5,
                      children: [
                        _buildValueCard("Professional Communication", "Transparent updates & active collaboration.", Icons.chat_bubble_outline),
                        _buildValueCard("Clean Code", "Maintainable, well-structured & modular code.", Icons.code),
                        _buildValueCard("Modern Design", "Futuristic glassmorphism & smooth UI.", Icons.brush),
                        _buildValueCard("Responsive Development", "Flawless display on all screens.", Icons.devices),
                        _buildValueCard("Creative Thinking", "Innovative solutions tailored to needs.", Icons.lightbulb_outline),
                        _buildValueCard("Fast Delivery", "On-time delivery without compromises.", Icons.bolt),
                        _buildValueCard("Continuous Learning", "Constantly updating skills with DevOps & AI.", Icons.school_outlined),
                        _buildValueCard("Reliable Support", "Dedicated post-launch assistance.", Icons.headset_mic_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),

                  // 3. Work Process Timeline
                  Text(
                    "METHODOLOGY",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Work Process",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "A structured 6-step workflow ensuring seamless execution from idea to deployment.",
                    style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: isMobile ? 1.05 : 1.35,
                      children: const [
                        _ProcessStep(num: "1", title: "Requirement Discussion", desc: "Understanding goals, target audience, and scope."),
                        _ProcessStep(num: "2", title: "Research & Planning", desc: "Tech stack selection & architecture blueprinting."),
                        _ProcessStep(num: "3", title: "UI/UX Design", desc: "Wireframing & interactive visual prototype."),
                        _ProcessStep(num: "4", title: "Development", desc: "Clean coding, API integration & state binding."),
                        _ProcessStep(num: "5", title: "Testing & QA", desc: "Cross-device verification & speed optimization."),
                        _ProcessStep(num: "6", title: "Deployment & Support", desc: "Live production release & ongoing support."),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      children: const [
                        Expanded(child: _ProcessStep(num: "1", title: "Requirement Discussion", desc: "Understanding goals & scope.")),
                        SizedBox(width: 10),
                        Expanded(child: _ProcessStep(num: "2", title: "Research & Planning", desc: "Tech stack & architecture.")),
                        SizedBox(width: 10),
                        Expanded(child: _ProcessStep(num: "3", title: "UI/UX Design", desc: "Wireframing & prototypes.")),
                        SizedBox(width: 10),
                        Expanded(child: _ProcessStep(num: "4", title: "Development", desc: "Clean coding & state binding.")),
                        SizedBox(width: 10),
                        Expanded(child: _ProcessStep(num: "5", title: "Testing & QA", desc: "Cross-device verification.")),
                        SizedBox(width: 10),
                        Expanded(child: _ProcessStep(num: "6", title: "Deployment", desc: "Live release & support.")),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),

                  // 4. Client Benefits Section
                  Text(
                    "GUARANTEED QUALITY",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Client Benefits",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Every project is built to meet high standards of performance, usability, and scale.",
                    style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 2 : 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: isMobile ? 1.8 : 2.0,
                    children: [
                      _buildBenefitCard("100% Responsive", "Optimized for all devices.", Icons.smartphone),
                      _buildBenefitCard("SEO Friendly", "Semantic HTML structure.", Icons.search),
                      _buildBenefitCard("Clean Code", "Modular, scalable codebase.", Icons.code),
                      _buildBenefitCard("Fast Speed", "Rapid loading speeds.", Icons.speed),
                      _buildBenefitCard("Cross-Browser", "Chrome, Firefox, Safari, Edge.", Icons.web),
                      _buildBenefitCard("Modern UI", "Dark mode glassmorphism.", Icons.auto_awesome),
                    ],
                  ),
                  const SizedBox(height: 64),

                  // 5. Pricing Packages
                  Text(
                    "TRANSPARENT PRICING",
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primaryCyan,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Flexible Project Packages",
                    style: AppTypography.title2.copyWith(fontSize: isMobile ? 20 : 26),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "No rigid fixed pricing — transparent quotes tailored precisely to your project scope and budget.",
                    style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  if (isMobile)
                    Column(
                      children: [
                        _buildPricingPackage(
                          badge: "STARTER",
                          name: "Single Page / Landing",
                          subtitle: "Ideal for individuals, personal portfolios, and single product promo pages.",
                          price: "Custom Quote",
                          features: [
                            "Free Initial Consultation",
                            "100% Mobile Responsive",
                            "Basic SEO & Meta Config",
                            "Contact Form Integration",
                            "7-Day Post Launch Support",
                          ],
                          onTap: () => shellController.navigateTo(AppRoutes.CONTACT),
                          compact: isMobile,
                        ),
                        const SizedBox(height: 16),
                        _buildPricingPackage(
                          badge: "MOST POPULAR",
                          name: "Full Web / Mobile App",
                          subtitle: "Comprehensive Flutter mobile app or multi-page corporate website.",
                          price: "Project-Based",
                          isPopular: true,
                          features: [
                            "Free Strategy & Specs Session",
                            "Flutter iOS & Android / Web",
                            "GetX & REST API Integration",
                            "Custom Dark UI Design",
                            "30-Day Post Launch Support",
                          ],
                          onTap: () => shellController.navigateTo(AppRoutes.CONTACT),
                          compact: isMobile,
                        ),
                        const SizedBox(height: 16),
                        _buildPricingPackage(
                          badge: "CUSTOM RETAINER",
                          name: "Agency & Retainer",
                          subtitle: "Ongoing development, maintenance, AI media, and DevOps support.",
                          price: "Flexible Retainer",
                          features: [
                            "Dedicated Monthly Hours",
                            "Priority 24/7 Bug Fixes",
                            "Graphic & Video Production",
                            "Docker & CI/CD Infrastructure",
                            "Weekly Progress Meetings",
                          ],
                          onTap: () => shellController.navigateTo(AppRoutes.CONTACT),
                          compact: isMobile,
                        ),
                      ],
                    )
                  else
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 0.72,
                      children: [
                        _buildPricingPackage(
                          badge: "STARTER",
                          name: "Single Page / Landing",
                          subtitle: "Ideal for individuals, personal portfolios, and single product promo pages.",
                          price: "Custom Quote",
                          features: [
                            "Free Initial Consultation",
                            "100% Mobile Responsive",
                            "Basic SEO & Meta Config",
                            "Contact Form Integration",
                            "7-Day Post Launch Support",
                          ],
                          onTap: () => shellController.navigateTo(AppRoutes.CONTACT),
                          compact: isMobile,
                        ),
                        _buildPricingPackage(
                          badge: "MOST POPULAR",
                          name: "Full Web / Mobile App",
                          subtitle: "Comprehensive Flutter mobile app or multi-page corporate website.",
                          price: "Project-Based",
                          isPopular: true,
                          features: [
                            "Free Strategy & Specs Session",
                            "Flutter iOS & Android / Web",
                            "GetX & REST API Integration",
                            "Custom Dark UI Design",
                            "30-Day Post Launch Support",
                          ],
                          onTap: () => shellController.navigateTo(AppRoutes.CONTACT),
                          compact: isMobile,
                        ),
                        _buildPricingPackage(
                          badge: "CUSTOM RETAINER",
                          name: "Agency & Retainer",
                          subtitle: "Ongoing development, maintenance, AI media, and DevOps support.",
                          price: "Flexible Retainer",
                          features: [
                            "Dedicated Monthly Hours",
                            "Priority 24/7 Bug Fixes",
                            "Graphic & Video Production",
                            "Docker & CI/CD Infrastructure",
                            "Weekly Progress Meetings",
                          ],
                          onTap: () => shellController.navigateTo(AppRoutes.CONTACT),
                          compact: isMobile,
                        ),
                      ],
                    ),
                  const SizedBox(height: 64),

                  // 6. Ready to Start CTA Banner
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
                            "READY TO START?",
                            style: AppTypography.caption.copyWith(
                              color: AppColors.primaryCyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Let's Build Something Amazing Together",
                          style: AppTypography.title1.copyWith(fontSize: isMobile ? 22 : 32),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 680),
                          child: Text(
                            "Have a new mobile application idea, website requirement, or branding project? Get in touch today for a free consultation.",
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
                              text: "Hire Me",
                              onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                            ),
                            CustomButton(
                              text: "Request Quote",
                              isOutline: true,
                              icon: Icons.request_quote_outlined,
                              onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                            ),
                            CustomButton(
                              text: "Schedule Meeting",
                              isOutline: true,
                              icon: Icons.calendar_month,
                              onPressed: () => shellController.navigateTo(AppRoutes.CONTACT),
                            ),
                            CustomButton(
                              text: "Download Resume",
                              isOutline: true,
                              icon: Icons.download,
                              onPressed: () => shellController.copyToClipboard(PortfolioDataProvider.email, "Resume"),
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

  Widget _buildValueCard(String title, String desc, IconData icon) {
    return GlassCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 22, color: AppColors.primaryCyan),
          const SizedBox(height: 8),
          Text(title, style: AppTypography.subtitle.copyWith(fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Text(desc, style: AppTypography.caption, maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  Widget _buildBenefitCard(String title, String desc, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(14),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: AppTypography.body2.copyWith(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                Text(desc, style: AppTypography.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPricingPackage({
    required String badge,
    required String name,
    required String subtitle,
    required String price,
    required List<String> features,
    required VoidCallback onTap,
    bool isPopular = false,
    bool compact = false,
  }) {
    return GlassCard(
      borderColor: isPopular ? AppColors.primaryCyan : null,
      padding: EdgeInsets.all(compact ? 12 : 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: compact ? 8 : 10, vertical: 4),
            decoration: BoxDecoration(
              color: isPopular ? AppColors.primaryCyan.withOpacity(0.15) : AppColors.surfaceDark,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: isPopular ? AppColors.primaryCyan : AppColors.glassBorder),
            ),
            child: Text(
              badge,
              style: AppTypography.caption.copyWith(
                color: isPopular ? AppColors.primaryCyan : AppColors.textMuted,
                fontWeight: FontWeight.bold,
                fontSize: compact ? 10 : 12,
              ),
            ),
          ),
          SizedBox(height: compact ? 10 : 16),
          Text(
            name,
            style: AppTypography.title2.copyWith(fontSize: compact ? 15 : 20),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary, fontSize: compact ? 11 : 13),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: compact ? 10 : 20),
          Text(
            price,
            style: AppTypography.title1.copyWith(color: AppColors.primaryCyan, fontSize: compact ? 16 : 24),
          ),
          SizedBox(height: compact ? 12 : 24),
          ...features.map((f) {
            return Padding(
              padding: EdgeInsets.only(bottom: compact ? 6 : 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check, size: compact ? 14 : 16, color: AppColors.accentGreen),
                  SizedBox(width: compact ? 6 : 8),
                  Expanded(
                    child: Text(
                      f,
                      style: AppTypography.body2.copyWith(fontSize: compact ? 11 : 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: compact ? 12 : 20),
          SizedBox(height: compact ? 12 : 28),
          CustomButton(
            text: isPopular ? (compact ? "Inquire" : "Inquire Full Package") : (compact ? "Get Quote" : "Get Custom Quote"),
            isOutline: !isPopular,
            width: double.infinity,
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}

class _ProcessStep extends StatelessWidget {
  final String num;
  final String title;
  final String desc;

  const _ProcessStep({required this.num, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.primaryCyan.withOpacity(0.2),
            child: Text(num, style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          Text(title, style: AppTypography.subtitle.copyWith(fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Text(desc, style: AppTypography.caption, maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
