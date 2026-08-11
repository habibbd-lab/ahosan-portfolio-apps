import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/certificate_model.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../../widgets/modal_dialog.dart';

class CertificatesController extends GetxController {
  final PortfolioRepository repository = PortfolioRepository();

  final RxString selectedCategory = 'All Credentials (5)'.obs;
  final RxString searchQuery = ''.obs;
  late final List<CertificateModel> allCertificates;

  final List<String> categories = [
    'All Credentials (5)',
    'Professional Certificates',
    'Training',
    'Future Certifications',
  ];

  @override
  void onInit() {
    super.onInit();
    allCertificates = repository.getCertificates();
  }

  List<CertificateModel> get filteredCertificates {
    return allCertificates.where((cert) {
      final matchesCategory = selectedCategory.value == 'All Credentials (5)' ||
          cert.category == selectedCategory.value;
      final matchesSearch = searchQuery.value.isEmpty ||
          cert.title.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          cert.institute.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          cert.credentialId.toLowerCase().contains(searchQuery.value.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }

  void showCertificateDetails(CertificateModel cert) {
    ModalDialog.show(
      title: cert.title,
      subtitle: "${cert.institute} • ${cert.date}",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("CREDENTIAL ID: ${cert.credentialId}", style: const TextStyle(fontFamily: 'monospace', color: Colors.cyan)),
                Text(cert.isVerified ? "STATUS: VERIFIED" : "STATUS: PLANNED", style: TextStyle(color: cert.isVerified ? Colors.green : Colors.orange, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(cert.description, style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.5)),
          const SizedBox(height: 16),
          const Text("Skills & Topics Mastered:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: cert.skills.map((s) => Chip(label: Text(s))).toList(),
          ),
        ],
      ),
    );
  }
}
