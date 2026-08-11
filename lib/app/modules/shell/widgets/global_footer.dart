import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/portfolio_data_provider.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/responsive_builder.dart';
import '../controllers/shell_controller.dart';

class GlobalFooter extends StatelessWidget {
  const GlobalFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShellController>();
    final isMobile = ResponsiveBuilder.isMobile(context);

    return Container(
      color: AppColors.backgroundSecondary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: 48,
      ),
      child: Column(
        children: [
          ResponsiveBuilder(
            mobile: (context, constraints) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBrandBio(controller),
                const SizedBox(height: 32),
                _buildQuickLinks(controller),
                const SizedBox(height: 32),
                _buildPortfolioLinks(controller),
                const SizedBox(height: 32),
                _buildSocialLinks(controller),
              ],
            ),
            desktop: (context, constraints) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _buildBrandBio(controller)),
                const SizedBox(width: 48),
                Expanded(child: _buildQuickLinks(controller)),
                Expanded(child: _buildPortfolioLinks(controller)),
                Expanded(child: _buildSocialLinks(controller)),
              ],
            ),
          ),
          const SizedBox(height: 48),
          const Divider(color: AppColors.glassBorder),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "© 2026 Ahosan Habib Hasan. All Rights Reserved.",
                style: AppTypography.caption,
              ),
              if (!isMobile)
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text("Privacy Policy", style: AppTypography.caption),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Terms of Service", style: AppTypography.caption),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBrandBio(ShellController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "AH",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              "AHOSAN HABIB HASAN",
              style: AppTypography.subtitle.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          PortfolioDataProvider.bioSummary,
          style: AppTypography.body2,
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _buildQuickLinks(ShellController controller) {
    final links = [
      {'name': 'About Me', 'route': AppRoutes.ABOUT},
      {'name': 'Skills', 'route': AppRoutes.SKILLS},
      {'name': 'Experience', 'route': AppRoutes.EXPERIENCE},
      {'name': 'Education', 'route': AppRoutes.EDUCATION},
      {'name': 'Certificates', 'route': AppRoutes.CERTIFICATES},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Links",
          style: AppTypography.subtitle.copyWith(fontSize: 15),
        ),
        const SizedBox(height: 12),
        ...links.map((link) {
          return InkWell(
            onTap: () => controller.navigateTo(link['route']!),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                link['name']!,
                style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildPortfolioLinks(ShellController controller) {
    final links = [
      {'name': 'Flutter Apps', 'route': AppRoutes.FLUTTER_APPS},
      {'name': 'Web Projects', 'route': AppRoutes.PROJECTS},
      {'name': 'Services', 'route': AppRoutes.SERVICES},
      {'name': 'DevOps Pathway', 'route': AppRoutes.EDUCATION},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Portfolio",
          style: AppTypography.subtitle.copyWith(fontSize: 15),
        ),
        const SizedBox(height: 12),
        ...links.map((link) {
          return InkWell(
            onTap: () => controller.navigateTo(link['route']!),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                link['name']!,
                style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSocialLinks(ShellController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Stay Connected",
          style: AppTypography.subtitle.copyWith(fontSize: 15),
        ),
        const SizedBox(height: 8),
        Text(
          "Reach out directly via email or social platforms.",
          style: AppTypography.caption,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildSocialIconButton(Icons.code, () => controller.launchURL(PortfolioDataProvider.github)),
            const SizedBox(width: 10),
            _buildSocialIconButton(Icons.business, () => controller.launchURL(PortfolioDataProvider.linkedin)),
            const SizedBox(width: 10),
            _buildSocialIconButton(Icons.email, () => controller.launchURL("mailto:${PortfolioDataProvider.email}")),
            const SizedBox(width: 10),
            _buildSocialIconButton(Icons.chat, () => controller.launchURL(PortfolioDataProvider.whatsapp)),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIconButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.glassBorder),
        ),
        child: Icon(icon, size: 18, color: AppColors.primaryCyan),
      ),
    );
  }
}
