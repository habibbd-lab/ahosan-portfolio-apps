import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/contact_form_model.dart';
import '../../../data/providers/portfolio_data_provider.dart';
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

  Uri buildMailtoUri() {
    final String mailSubject = formModel.subject.trim().isNotEmpty
        ? formModel.subject.trim()
        : "Portfolio Inquiry: ${formModel.service}";

    final String mailBody = "Name: ${formModel.name.trim()}\n"
        "Email: ${formModel.email.trim()}\n"
        "Phone: ${formModel.phone.trim().isNotEmpty ? formModel.phone.trim() : 'N/A'}\n"
        "Company: ${formModel.company.trim().isNotEmpty ? formModel.company.trim() : 'N/A'}\n"
        "Service Requested: ${formModel.service}\n"
        "Budget Range: ${formModel.budget}\n\n"
        "Message:\n${formModel.message.trim()}";

    return Uri(
      scheme: 'mailto',
      path: PortfolioDataProvider.email,
      queryParameters: {
        'subject': mailSubject,
        'body': mailBody,
      },
    );
  }

  Future<void> submitForm() async {
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
      try {
        final Uri mailtoUri = buildMailtoUri();
        if (await canLaunchUrl(mailtoUri)) {
          final bool launched = await launchUrl(mailtoUri);
          if (launched) {
            Get.snackbar(
              "Email Client Opened",
              "Opening your mail application to send message to ${PortfolioDataProvider.email}",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: const Color(0xFF00F5A0),
              colorText: Colors.black,
              duration: const Duration(seconds: 4),
            );
          } else {
            _showMailErrorSnackbar();
          }
        } else {
          _showMailErrorSnackbar();
        }
      } catch (e) {
        _showMailErrorSnackbar();
      } finally {
        isSubmitting.value = false;
      }
    }
  }

  void _showMailErrorSnackbar() {
    Get.snackbar(
      "Mail Client Unavailable",
      "Could not open email application. Please email directly to ${PortfolioDataProvider.email}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.amber,
      colorText: Colors.black,
      duration: const Duration(seconds: 5),
    );
  }
}

