import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/certificate_model.dart';
import '../models/service_model.dart';
import '../models/experience_model.dart';
import '../models/testimonial_model.dart';
import '../providers/portfolio_data_provider.dart';

class PortfolioRepository {
  List<ProjectModel> getProjects() => PortfolioDataProvider.projects;
  
  List<ProjectModel> getFeaturedProjects() =>
      PortfolioDataProvider.projects.where((p) => p.isFeatured).toList();

  List<ProjectModel> getFlutterApps() =>
      PortfolioDataProvider.projects.where((p) => p.isFlutterApp).toList();

  List<SkillModel> getSkills() => PortfolioDataProvider.skills;

  List<SkillModel> getTopFeaturedSkills() =>
      PortfolioDataProvider.skills.where((s) => s.isTopFeatured).toList();

  List<CertificateModel> getCertificates() => PortfolioDataProvider.certificates;

  List<ServiceModel> getServices() => PortfolioDataProvider.services;

  List<ExperienceModel> getExperiences() => PortfolioDataProvider.experiences;

  List<TestimonialModel> getTestimonials() => PortfolioDataProvider.testimonials;

  List<Map<String, String>> getFaqs() => PortfolioDataProvider.faqs;
}
