import 'dart:async';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../shell/controllers/shell_controller.dart';

class SplashController extends GetxController {
  bool _hasNavigated = false;

  @override
  void onInit() {
    super.onInit();
    if (!Get.isRegistered<ShellController>()) {
      Get.put(ShellController(), permanent: true);
    }
  }

  @override
  void onReady() {
    super.onReady();
    _startSplashTimer();
  }

  void _startSplashTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      goToHome();
    });
  }

  void goToHome() {
    if (_hasNavigated) return;
    _hasNavigated = true;
    Get.offAllNamed(AppRoutes.HOME);
  }
}
