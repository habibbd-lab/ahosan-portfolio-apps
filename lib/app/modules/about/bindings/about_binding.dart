import 'package:get/get.dart';
import '../controllers/about_controller.dart';
import '../../shell/controllers/shell_controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShellController>(() => ShellController());
    Get.lazyPut<AboutController>(() => AboutController());
  }
}
