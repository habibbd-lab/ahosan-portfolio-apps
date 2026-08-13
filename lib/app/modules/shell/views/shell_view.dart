import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../widgets/global_search_dialog.dart';
import '../../../widgets/responsive_builder.dart';
import '../controllers/shell_controller.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/top_nav_bar.dart';

class ShellView extends GetView<ShellController> {
  final Widget child;

  const ShellView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBuilder.isDesktop(context);
    final isMobile = ResponsiveBuilder.isMobile(context);

    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: isDesktop
            ? const TopNavBar()
            : AppBar(
                backgroundColor: AppColors.backgroundSecondary.withOpacity(0.95),
                elevation: 0,
                centerTitle: false,
                title: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "AH",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "AHOSAN HABIB HASAN",
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.subtitle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.primaryCyan,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search, size: 20, color: AppColors.textPrimary),
                    onPressed: () => GlobalSearchDialog.show(),
                    tooltip: "Search Portfolio",
                  ),
                  IconButton(
                    icon: Icon(
                      controller.isDarkMode.value
                          ? Icons.wb_sunny_outlined
                          : Icons.nightlight_round_outlined,
                      size: 20,
                      color: AppColors.primaryCyan,
                    ),
                    onPressed: () => controller.toggleTheme(),
                    tooltip: controller.isDarkMode.value
                        ? "Switch to Light Mode"
                        : "Switch to Dark Mode",
                  ),
                ],
              ),
        drawer: const MobileDrawer(),
        body: child,
        bottomNavigationBar: isMobile ? const BottomNavBar() : null,
      );
    });
  }
}
