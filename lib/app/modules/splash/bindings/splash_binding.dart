import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
import '../../shell/controllers/shell_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ShellController>()) {
      Get.put(ShellController(), permanent: true);
    }
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
