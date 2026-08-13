import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/global_search_dialog.dart';
import '../controllers/shell_controller.dart';

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShellController>();

    final navItems = [
      {'name': 'Home', 'route': AppRoutes.HOME},
      {'name': 'About', 'route': AppRoutes.ABOUT},
      {'name': 'Skills', 'route': AppRoutes.SKILLS},
      {'name': 'Experience', 'route': AppRoutes.EXPERIENCE},
      {'name': 'Education', 'route': AppRoutes.EDUCATION},
      {'name': 'Projects', 'route': AppRoutes.PROJECTS},
      {'name': 'Flutter Apps', 'route': AppRoutes.FLUTTER_APPS},
      {'name': 'Services', 'route': AppRoutes.SERVICES},
      {'name': 'Certificates', 'route': AppRoutes.CERTIFICATES},
      {'name': 'Contact', 'route': AppRoutes.CONTACT},
    ];

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(
            color: AppColors.isDark ? const Color(0x990A0F1D) : const Color(0xCCFFFFFF),
            border: Border(
              bottom: BorderSide(color: AppColors.glassBorder, width: 1),
            ),
          ),
          child: Row(
            children: [
              // Logo Badge
              GestureDetector(
                onTap: () => controller.navigateTo(AppRoutes.HOME),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.primaryCyan,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),

              // Navigation Links
              Obx(() {
                return Row(
                  children: navItems.map((item) {
                    final isSelected =
                        controller.currentRoute.value == item['route'];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () => controller.navigateTo(item['route']!),
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: isSelected
                              ? BoxDecoration(
                                  color: AppColors.primaryCyan.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.primaryCyan.withOpacity(0.3),
                                  ),
                                )
                              : null,
                          child: Text(
                            item['name']!,
                            style: AppTypography.caption.copyWith(
                              color: isSelected
                                  ? AppColors.primaryCyan
                                  : AppColors.textSecondary,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),

              const SizedBox(width: 8),

              IconButton(
                icon: Icon(
                  Icons.search,
                  color: AppColors.primaryCyan,
                  size: 20,
                ),
                onPressed: () => GlobalSearchDialog.show(),
                tooltip: "Search Portfolio",
              ),

              const SizedBox(width: 4),

              Obx(() => IconButton(
                icon: Icon(
                  controller.isDarkMode.value
                      ? Icons.wb_sunny_outlined
                      : Icons.nightlight_round_outlined,
                  color: AppColors.primaryCyan,
                  size: 20,
                ),
                onPressed: () => controller.toggleTheme(),
                tooltip: controller.isDarkMode.value
                    ? "Switch to Light Mode"
                    : "Switch to Dark Mode",
              )),

              const SizedBox(width: 12),

              // Hire Me CTA Button
              CustomButton(
                text: "Resume",
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                onPressed: () => controller.navigateTo(AppRoutes.CONTACT),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
