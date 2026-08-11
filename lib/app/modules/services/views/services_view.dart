import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                horizontal: isMobile ? 24 : 64,
                vertical: 64,
              ),
              child: Column(
                children: [
                  const SectionHeader(
                    tag: "My Services",
                    title: "Professional Digital Solutions",
                    subtitle: "Helping businesses, startups, and individuals build modern applications, websites, digital brands, and AI-powered solutions with agency-level quality.",
                  ),
                  const SizedBox(height: 48),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: controller.services.map((s) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: ServiceCard(
                            service: s,
                            onLearnMore: () => controller.showServiceDetails(s),
                            onRequest: () => shellController.navigateTo(AppRoutes.CONTACT),
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
                        childAspectRatio: 0.78,
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
                  ),

                  const SizedBox(height: 64),

                  // Work Process Timeline
                  Text("Work Process", style: AppTypography.title1),
                  const SizedBox(height: 8),
                  Text("A structured 6-step workflow ensuring seamless execution from idea to deployment.", style: AppTypography.body2),
                  const SizedBox(height: 36),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: const [
                        _ProcessStep(num: "1", title: "Requirement Discussion", desc: "Understanding goals, target audience, and scope."),
                        SizedBox(height: 16),
                        _ProcessStep(num: "2", title: "Research & Planning", desc: "Tech stack selection & architecture blueprinting."),
                        SizedBox(height: 16),
                        _ProcessStep(num: "3", title: "UI/UX Design", desc: "Wireframing & interactive visual prototype."),
                        SizedBox(height: 16),
                        _ProcessStep(num: "4", title: "Development", desc: "Clean coding, API integration & state binding."),
                        SizedBox(height: 16),
                        _ProcessStep(num: "5", title: "Testing & QA", desc: "Cross-device verification & speed optimization."),
                        SizedBox(height: 16),
                        _ProcessStep(num: "6", title: "Deployment & Support", desc: "Live production release & ongoing support."),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      children: const [
                        Expanded(child: _ProcessStep(num: "1", title: "Requirement Discussion", desc: "Understanding goals & scope.")),
                        SizedBox(width: 12),
                        Expanded(child: _ProcessStep(num: "2", title: "Research & Planning", desc: "Tech stack & architecture.")),
                        SizedBox(width: 12),
                        Expanded(child: _ProcessStep(num: "3", title: "UI/UX Design", desc: "Wireframing & prototypes.")),
                        SizedBox(width: 12),
                        Expanded(child: _ProcessStep(num: "4", title: "Development", desc: "Clean coding & state binding.")),
                        SizedBox(width: 12),
                        Expanded(child: _ProcessStep(num: "5", title: "Testing & QA", desc: "Cross-device verification.")),
                        SizedBox(width: 12),
                        Expanded(child: _ProcessStep(num: "6", title: "Deployment", desc: "Live release & support.")),
                      ],
                    ),
                  ),

                  const SizedBox(height: 64),

                  // Pricing Packages
                  Text("Flexible Project Packages", style: AppTypography.title1),
                  const SizedBox(height: 8),
                  Text("No rigid fixed pricing — transparent quotes tailored precisely to your project scope and budget.", style: AppTypography.body2),
                  const SizedBox(height: 36),

                  ResponsiveBuilder(
                    mobile: (context, constraints) => Column(
                      children: [
                        _buildPricingPackage(
                          badge: "STARTER",
                          name: "Single Page / Landing",
                          subtitle: "Ideal for individuals, personal portfolios, and single product promo pages.",
                          price: "Custom Quote",
                          features: ["Free Initial Consultation", "100% Mobile Responsive", "Basic SEO & Meta Configuration", "Contact Form Integration"],
                          onTap: () => shellController.navigateTo(AppRoutes.CONTACT),
                        ),
                        const SizedBox(height: 24),
                        _buildPricingPackage(
                          badge: "MOST POPULAR",
                          name: "Full Web / Mobile App",
                          subtitle: "Comprehensive Flutter mobile application or multi-page corporate website.",
                          price: "Project-Based",
                          isPopular: true,
                          features: ["Free Strategy & Specs Session", "Flutter iOS & Android / Full Web", "GetX State Management & REST API", "30-Day Post Launch Support"],
                          onTap: () => shellController.navigateTo(AppRoutes.CONTACT),
                        ),
                        const SizedBox(height: 24),
                        _buildPricingPackage(
                          badge: "CUSTOM RETAINER",
                          name: "Agency & Retainer",
                          subtitle: "Ongoing development, maintenance, AI media creation, and DevOps support.",
                          price: "Flexible Retainer",
                          features: ["Dedicated Monthly Hours", "Priority 24/7 Bug Fixes", "Graphic Design & Video Production", "Docker & CI/CD Infrastructure"],
                          onTap: () => shellController.navigateTo(AppRoutes.CONTACT),
                        ),
                      ],
                    ),
                    desktop: (context, constraints) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildPricingPackage(
                            badge: "STARTER",
                            name: "Single Page / Landing",
                            subtitle: "Ideal for individuals, personal portfolios, and single product promo pages.",
                            price: "Custom Quote",
                            features: ["Free Initial Consultation", "100% Mobile Responsive", "Basic SEO & Meta Configuration", "Contact Form Integration"],
                            onTap: () => shellController.navigateTo(AppRoutes.CONTACT),
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _buildPricingPackage(
                            badge: "MOST POPULAR",
                            name: "Full Web / Mobile App",
                            subtitle: "Comprehensive Flutter mobile application or multi-page corporate website.",
                            price: "Project-Based",
                            isPopular: true,
                            features: ["Free Strategy & Specs Session", "Flutter iOS & Android / Full Web", "GetX State Management & REST API", "30-Day Post Launch Support"],
                            onTap: () => shellController.navigateTo(AppRoutes.CONTACT),
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _buildPricingPackage(
                            badge: "CUSTOM RETAINER",
                            name: "Agency & Retainer",
                            subtitle: "Ongoing development, maintenance, AI media creation, and DevOps support.",
                            price: "Flexible Retainer",
                            features: ["Dedicated Monthly Hours", "Priority 24/7 Bug Fixes", "Graphic Design & Video Production", "Docker & CI/CD Infrastructure"],
                            onTap: () => shellController.navigateTo(AppRoutes.CONTACT),
                          ),
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

  Widget _buildPricingPackage({
    required String badge,
    required String name,
    required String subtitle,
    required String price,
    required List<String> features,
    required VoidCallback onTap,
    bool isPopular = false,
  }) {
    return GlassCard(
      borderColor: isPopular ? AppColors.primaryCyan : null,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isPopular
                  ? AppColors.primaryCyan.withOpacity(0.15)
                  : AppColors.surfaceDark,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isPopular ? AppColors.primaryCyan : AppColors.glassBorder,
              ),
            ),
            child: Text(
              badge,
              style: AppTypography.caption.copyWith(
                color: isPopular ? AppColors.primaryCyan : AppColors.textMuted,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(name, style: AppTypography.title2.copyWith(fontSize: 20)),
          const SizedBox(height: 6),
          Text(subtitle, style: AppTypography.body2),
          const SizedBox(height: 20),
          Text(price, style: AppTypography.title1.copyWith(color: AppColors.primaryCyan)),
          const SizedBox(height: 24),
          ...features.map((f) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  const Icon(Icons.check, size: 16, color: AppColors.accentGreen),
                  const SizedBox(width: 8),
                  Expanded(child: Text(f, style: AppTypography.body2)),
                ],
              ),
            );
          }),
          const SizedBox(height: 32),
          CustomButton(
            text: "Inquire Package",
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.primaryCyan.withOpacity(0.2),
            child: Text(num, style: AppTypography.caption.copyWith(color: AppColors.primaryCyan, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          Text(title, style: AppTypography.subtitle.copyWith(fontSize: 15)),
          const SizedBox(height: 6),
          Text(desc, style: AppTypography.body2),
        ],
      ),
    );
  }
}
