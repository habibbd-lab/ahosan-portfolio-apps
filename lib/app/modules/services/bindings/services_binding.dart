import 'package:get/get.dart';
import '../controllers/services_controller.dart';
import '../../shell/controllers/shell_controller.dart';

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShellController>(() => ShellController());
    Get.lazyPut<ServicesController>(() => ServicesController());
  }
}
