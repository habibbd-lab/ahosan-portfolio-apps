import 'package:get/get.dart';
import '../../../data/models/experience_model.dart';
import '../../../data/repositories/portfolio_repository.dart';

class ExperienceController extends GetxController {
  final PortfolioRepository repository = PortfolioRepository();

  final RxString selectedCategory = 'All Milestones'.obs;
  late final List<ExperienceModel> allExperiences;

  final List<String> categories = [
    'All Milestones',
    'Professional Work',
    'Education & Training',
  ];

  @override
  void onInit() {
    super.onInit();
    allExperiences = repository.getExperiences();
  }

  List<ExperienceModel> get filteredExperiences {
    if (selectedCategory.value == 'All Milestones') {
      return allExperiences;
    }
    return allExperiences
        .where((e) => e.category == selectedCategory.value)
        .toList();
  }

  void selectCategory(String cat) {
    selectedCategory.value = cat;
  }
}
