import 'package:get/get.dart';
import '../../../data/models/skill_model.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../../widgets/modal_dialog.dart';
import 'package:flutter/material.dart';

class SkillsController extends GetxController {
  final PortfolioRepository repository = PortfolioRepository();

  final RxString selectedCategory = 'All Categories'.obs;
  final RxString searchQuery = ''.obs;
  late final List<SkillModel> allSkills;
  late final List<SkillModel> topFeaturedSkills;

  final List<String> categories = [
    'All Categories',
    'Mobile Dev',
    'Web Dev',
    'Version Control',
    'Graphic Design',
    'Marketing',
    'AI Tools',
  ];

  @override
  void onInit() {
    super.onInit();
    allSkills = repository.getSkills();
    topFeaturedSkills = repository.getTopFeaturedSkills();
  }

  List<SkillModel> get filteredSkills {
    return allSkills.where((skill) {
      final matchesCategory = selectedCategory.value == 'All Categories' ||
          skill.category == selectedCategory.value;
      final matchesSearch = searchQuery.value.isEmpty ||
          skill.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          skill.description.toLowerCase().contains(searchQuery.value.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }

  void showSkillDetails(SkillModel skill) {
    ModalDialog.show(
      title: skill.name,
      subtitle: "${skill.category} • ${skill.level} (${skill.percentage}%)",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(skill.description, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(skill.details, style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.5)),
        ],
      ),
    );
  }
}
