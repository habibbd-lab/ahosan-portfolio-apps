import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../routes/app_routes.dart';

class ShellController extends GetxController {
  final RxString currentRoute = AppRoutes.HOME.obs;
  final RxInt selectedBottomNavIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Sync current route
    currentRoute.value = Get.currentRoute.isEmpty ? AppRoutes.HOME : Get.currentRoute;
    _updateBottomNavIndex(currentRoute.value);
  }

  void navigateTo(String route) {
    if (currentRoute.value == route) return;
    currentRoute.value = route;
    _updateBottomNavIndex(route);
    Get.toNamed(route);
  }

  void _updateBottomNavIndex(String route) {
    switch (route) {
      case AppRoutes.HOME:
        selectedBottomNavIndex.value = 0;
        break;
      case AppRoutes.SKILLS:
        selectedBottomNavIndex.value = 1;
        break;
      case AppRoutes.PROJECTS:
        selectedBottomNavIndex.value = 2;
        break;
      case AppRoutes.SERVICES:
        selectedBottomNavIndex.value = 3;
        break;
      case AppRoutes.CONTACT:
        selectedBottomNavIndex.value = 4;
        break;
      default:
        selectedBottomNavIndex.value = 0;
        break;
    }
  }

  Future<void> launchURL(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> copyToClipboard(String text, String label) async {
    Get.snackbar(
      "Copied!",
      "$label copied to clipboard.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF141F36),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );
  }
}
