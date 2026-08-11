import 'package:get/get.dart';
import '../controllers/flutter_apps_controller.dart';
import '../../shell/controllers/shell_controller.dart';

class FlutterAppsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShellController>(() => ShellController());
    Get.lazyPut<FlutterAppsController>(() => FlutterAppsController());
  }
}
