import 'package:get/get.dart';
import '../controllers/education_controller.dart';
import '../../shell/controllers/shell_controller.dart';

class EducationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShellController>(() => ShellController());
    Get.lazyPut<EducationController>(() => EducationController());
  }
}
