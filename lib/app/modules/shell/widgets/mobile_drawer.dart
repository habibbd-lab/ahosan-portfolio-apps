import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/portfolio_data_provider.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../controllers/shell_controller.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShellController>();

    final navItems = [
      {'name': 'Home', 'route': AppRoutes.HOME, 'icon': Icons.home_outlined},
      {'name': 'About', 'route': AppRoutes.ABOUT, 'icon': Icons.person_outline},
      {'name': 'Skills', 'route': AppRoutes.SKILLS, 'icon': Icons.code},
      {'name': 'Experience', 'route': AppRoutes.EXPERIENCE, 'icon': Icons.work_outline},
      {'name': 'Education', 'route': AppRoutes.EDUCATION, 'icon': Icons.school_outlined},
      {'name': 'Projects', 'route': AppRoutes.PROJECTS, 'icon': Icons.folder_outlined},
      {'name': 'Flutter Apps', 'route': AppRoutes.FLUTTER_APPS, 'icon': Icons.phone_android},
      {'name': 'Services', 'route': AppRoutes.SERVICES, 'icon': Icons.design_services_outlined},
      {'name': 'Certificates', 'route': AppRoutes.CERTIFICATES, 'icon': Icons.card_membership_outlined},
      {'name': 'Contact', 'route': AppRoutes.CONTACT, 'icon': Icons.mail_outline},
    ];

    return Drawer(
      backgroundColor: AppColors.backgroundSecondary,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceDark,
                border: Border(bottom: BorderSide(color: AppColors.glassBorder)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "AH",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ahosan Habib Hasan",
                        style: AppTypography.subtitle.copyWith(fontSize: 15),
                      ),
                      Text(
                        "Flutter & Web Developer",
                        style: AppTypography.caption,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Menu items list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 12),
                children: [
                  ...List.generate(navItems.length, (index) {
                    final item = navItems[index];
                    return Obx(() {
                      final isSelected = controller.currentRoute.value == item['route'];
                      return ListTile(
                        leading: Icon(
                          item['icon'] as IconData,
                          color: isSelected ? AppColors.primaryCyan : AppColors.textMuted,
                        ),
                        title: Text(
                          item['name'] as String,
                          style: AppTypography.body1.copyWith(
                            color: isSelected ? AppColors.primaryCyan : AppColors.textPrimary,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        selected: isSelected,
                        selectedTileColor: AppColors.primaryCyan.withOpacity(0.1),
                        onTap: () {
                          Navigator.of(context).pop();
                          controller.navigateTo(item['route'] as String);
                        },
                      );
                    });
                  }),
                  Divider(color: AppColors.glassBorder),
                  Obx(() => ListTile(
                        leading: Icon(
                          controller.isDarkMode.value
                              ? Icons.wb_sunny_outlined
                              : Icons.nightlight_round_outlined,
                          color: AppColors.primaryCyan,
                        ),
                        title: Text(
                          controller.isDarkMode.value
                              ? "Switch to Light Mode"
                              : "Switch to Dark Mode",
                          style: AppTypography.body1.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          controller.toggleTheme();
                        },
                      )),
                ],
              ),
            ),
            // Contact Channels Action Bar at bottom of Drawer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.surfaceDark,
                border: Border(top: BorderSide(color: AppColors.glassBorder)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.chat, color: AppColors.primaryCyan, size: 20),
                    onPressed: () => controller.launchURL(PortfolioDataProvider.whatsappUrl),
                    tooltip: "WhatsApp",
                  ),
                  IconButton(
                    icon: Icon(Icons.email_outlined, color: AppColors.primaryCyan, size: 20),
                    onPressed: () => controller.launchURL(PortfolioDataProvider.emailUrl),
                    tooltip: "Gmail",
                  ),
                  IconButton(
                    icon: Icon(Icons.phone_outlined, color: AppColors.primaryCyan, size: 20),
                    onPressed: () => controller.launchURL(PortfolioDataProvider.phoneUrl),
                    tooltip: "Phone Dialer",
                  ),
                  IconButton(
                    icon: Icon(Icons.code, color: AppColors.primaryCyan, size: 20),
                    onPressed: () => controller.launchURL(PortfolioDataProvider.githubUrl),
                    tooltip: "GitHub",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
