import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/project_model.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../../widgets/modal_dialog.dart';

class FlutterAppsController extends GetxController {
  final PortfolioRepository repository = PortfolioRepository();

  final RxString selectedCategory = 'All Apps (12)'.obs;
  final RxString searchQuery = ''.obs;
  late final List<ProjectModel> flutterApps;

  final List<String> categories = [
    'All Apps (12)',
    'Agency Apps',
    'Mobile UI Kits',
    'REST API Apps',
  ];

  @override
  void onInit() {
    super.onInit();
    flutterApps = repository.getFlutterApps();
  }

  List<ProjectModel> get filteredApps {
    return flutterApps.where((app) {
      final matchesCategory = selectedCategory.value == 'All Apps (12)' ||
          (selectedCategory.value == 'Agency Apps' && (app.id == 'chef-starz' || app.id == 'worker-hiring' || app.id == 'artisan')) ||
          (selectedCategory.value == 'Mobile UI Kits' && app.tags.contains('Custom Painter')) ||
          (selectedCategory.value == 'REST API Apps' && app.tags.contains('REST API'));
      final matchesSearch = searchQuery.value.isEmpty ||
          app.title.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          app.description.toLowerCase().contains(searchQuery.value.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }

  void showAppPreview(ProjectModel app) {
    ModalDialog.show(
      title: "${app.title} - Live Preview",
      subtitle: app.category,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(Icons.play_circle_outline, size: 64, color: Colors.cyan),
            ),
          ),
          const SizedBox(height: 16),
          Text(app.description, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }

  void showAppSpecs(ProjectModel app) {
    ModalDialog.show(
      title: "${app.title} - Technical Specs",
      subtitle: "Status: ${app.status}",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(app.fullDetails, style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.5)),
          const SizedBox(height: 16),
          const Text("Technologies Used:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: app.tags.map((t) => Chip(label: Text(t))).toList(),
          ),
        ],
      ),
    );
  }
}
