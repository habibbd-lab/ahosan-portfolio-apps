import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../controllers/shell_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShellController>();

    final items = [
      {'label': 'Home', 'icon': Icons.home_outlined, 'activeIcon': Icons.home, 'route': AppRoutes.HOME},
      {'label': 'Skills', 'icon': Icons.code_outlined, 'activeIcon': Icons.code, 'route': AppRoutes.SKILLS},
      {'label': 'Projects', 'icon': Icons.folder_outlined, 'activeIcon': Icons.folder, 'route': AppRoutes.PROJECTS},
      {'label': 'Services', 'icon': Icons.design_services_outlined, 'activeIcon': Icons.design_services, 'route': AppRoutes.SERVICES},
      {'label': 'Contact', 'icon': Icons.mail_outline, 'activeIcon': Icons.mail, 'route': AppRoutes.CONTACT},
    ];

    return Obx(() {
      return Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundSecondary,
          border: Border(top: BorderSide(color: AppColors.glassBorder, width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: controller.selectedBottomNavIndex.value,
          onTap: (index) {
            final targetRoute = items[index]['route'] as String;
            controller.navigateTo(targetRoute);
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryCyan,
          unselectedItemColor: AppColors.textMuted,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          items: items.map((item) {
            return BottomNavigationBarItem(
              icon: Icon(item['icon'] as IconData),
              activeIcon: Icon(item['activeIcon'] as IconData),
              label: item['label'] as String,
            );
          }).toList(),
        ),
      );
    });
  }
}
