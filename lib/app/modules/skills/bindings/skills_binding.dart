import 'package:get/get.dart';
import '../controllers/skills_controller.dart';
import '../../shell/controllers/shell_controller.dart';

class SkillsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShellController>(() => ShellController());
    Get.lazyPut<SkillsController>(() => SkillsController());
  }
}
