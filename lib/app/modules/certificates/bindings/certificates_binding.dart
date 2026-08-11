import 'package:get/get.dart';
import '../controllers/certificates_controller.dart';
import '../../shell/controllers/shell_controller.dart';

class CertificatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShellController>(() => ShellController());
    Get.lazyPut<CertificatesController>(() => CertificatesController());
  }
}
