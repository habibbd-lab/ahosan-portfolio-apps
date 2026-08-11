import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import '../../shell/controllers/shell_controller.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShellController>(() => ShellController());
    Get.lazyPut<ContactController>(() => ContactController());
  }
}
