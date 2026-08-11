import 'package:get/get.dart';
import '../../../data/models/project_model.dart';
import '../../../data/models/service_model.dart';
import '../../../data/models/skill_model.dart';
import '../../../data/models/testimonial_model.dart';
import '../../../data/repositories/portfolio_repository.dart';

class HomeController extends GetxController {
  final PortfolioRepository repository = PortfolioRepository();

  late final List<ProjectModel> featuredProjects;
  late final List<SkillModel> topSkills;
  late final List<ServiceModel> services;
  late final List<TestimonialModel> testimonials;

  @override
  void onInit() {
    super.onInit();
    featuredProjects = repository.getFeaturedProjects();
    topSkills = repository.getTopFeaturedSkills();
    services = repository.getServices().take(3).toList();
    testimonials = repository.getTestimonials();
  }
}
