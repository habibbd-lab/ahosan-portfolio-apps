import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/contact_form_model.dart';
import '../../../data/repositories/portfolio_repository.dart';

class ContactController extends GetxController {
  final PortfolioRepository repository = PortfolioRepository();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ContactFormModel formModel = ContactFormModel();

  final RxBool isSubmitting = false.obs;
  final RxInt expandedFaqIndex = (-1).obs;

  late final List<Map<String, String>> faqs;

  @override
  void onInit() {
    super.onInit();
    faqs = repository.getFaqs();
  }

  void toggleFaq(int index) {
    if (expandedFaqIndex.value == index) {
      expandedFaqIndex.value = -1;
    } else {
      expandedFaqIndex.value = index;
    }
  }

  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      if (!formModel.agreeTerms) {
        Get.snackbar(
          "Agreement Required",
          "Please agree to the processing of data before sending message.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
        return;
      }

      isSubmitting.value = true;
      Future.delayed(const Duration(seconds: 1), () {
        isSubmitting.value = false;
        Get.snackbar(
          "Message Sent!",
          "Thank you! Your message has been sent successfully. Md: Ahosan Habib Hasan will reply within 2 hours.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFF00F5A0),
          colorText: Colors.black,
          duration: const Duration(seconds: 4),
        );
      });
    }
  }
}
