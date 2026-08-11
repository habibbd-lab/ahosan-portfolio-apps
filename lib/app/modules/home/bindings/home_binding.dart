import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../shell/controllers/shell_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShellController>(() => ShellController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
