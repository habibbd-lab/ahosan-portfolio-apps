import 'package:get/get.dart';
import '../controllers/projects_controller.dart';
import '../../shell/controllers/shell_controller.dart';

class ProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShellController>(() => ShellController());
    Get.lazyPut<ProjectsController>(() => ProjectsController());
  }
}
