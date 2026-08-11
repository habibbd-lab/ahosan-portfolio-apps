import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/project_model.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../../widgets/modal_dialog.dart';

class ProjectsController extends GetxController {
  final PortfolioRepository repository = PortfolioRepository();

  final RxString selectedCategory = 'All Projects'.obs;
  final RxString searchQuery = ''.obs;
  late final List<ProjectModel> allProjects;

  final List<String> categories = [
    'All Projects',
    'Flutter',
    'Web',
    'Graphic Design',
    'AI',
    'Video Editing',
    'Digital Marketing',
    'DevOps',
  ];

  @override
  void onInit() {
    super.onInit();
    allProjects = repository.getProjects();
  }

  List<ProjectModel> get filteredProjects {
    return allProjects.where((project) {
      final matchesCategory = selectedCategory.value == 'All Projects' ||
          project.category == selectedCategory.value;
      final matchesSearch = searchQuery.value.isEmpty ||
          project.title.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          project.description.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          project.tags.any((t) => t.toLowerCase().contains(searchQuery.value.toLowerCase()));
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }

  void showProjectDetails(ProjectModel project) {
    ModalDialog.show(
      title: project.title,
      subtitle: "${project.category} • Status: ${project.status}",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.description,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),
          Text(
            project.fullDetails,
            style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: project.tags.map((t) => Chip(label: Text(t))).toList(),
          ),
        ],
      ),
    );
  }
}
