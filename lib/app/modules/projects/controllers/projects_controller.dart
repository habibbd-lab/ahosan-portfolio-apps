import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/project_model.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/modal_dialog.dart';
import '../../../widgets/project_image_slider.dart';

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
          ProjectImageSlider(
            images: project.images,
            height: 200,
            projectTitle: project.title,
          ),
          const SizedBox(height: 16),
          Text(
            project.description,
            style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            project.fullDetails,
            style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
          ),
          const SizedBox(height: 16),
          const Text("Technologies & Stack:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.tags.map((t) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Text(
                  t,
                  style: TextStyle(color: AppColors.primaryCyan, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
