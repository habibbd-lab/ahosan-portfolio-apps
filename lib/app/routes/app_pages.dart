import 'package:get/get.dart';
import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/certificates/bindings/certificates_binding.dart';
import '../modules/certificates/views/certificates_view.dart';
import '../modules/contact/bindings/contact_binding.dart';
import '../modules/contact/views/contact_view.dart';
import '../modules/education/bindings/education_binding.dart';
import '../modules/education/views/education_view.dart';
import '../modules/experience/bindings/experience_binding.dart';
import '../modules/experience/views/experience_view.dart';
import '../modules/flutter_apps/bindings/flutter_apps_binding.dart';
import '../modules/flutter_apps/views/flutter_apps_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/projects/bindings/projects_binding.dart';
import '../modules/projects/views/projects_view.dart';
import '../modules/services/bindings/services_binding.dart';
import '../modules/services/views/services_view.dart';
import '../modules/skills/bindings/skills_binding.dart';
import '../modules/skills/views/skills_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.SPLASH;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: AppRoutes.SKILLS,
      page: () => const SkillsView(),
      binding: SkillsBinding(),
    ),
    GetPage(
      name: AppRoutes.EXPERIENCE,
      page: () => const ExperienceView(),
      binding: ExperienceBinding(),
    ),
    GetPage(
      name: AppRoutes.EDUCATION,
      page: () => const EducationView(),
      binding: EducationBinding(),
    ),
    GetPage(
      name: AppRoutes.PROJECTS,
      page: () => const ProjectsView(),
      binding: ProjectsBinding(),
    ),
    GetPage(
      name: AppRoutes.FLUTTER_APPS,
      page: () => const FlutterAppsView(),
      binding: FlutterAppsBinding(),
    ),
    GetPage(
      name: AppRoutes.SERVICES,
      page: () => const ServicesView(),
      binding: ServicesBinding(),
    ),
    GetPage(
      name: AppRoutes.CERTIFICATES,
      page: () => const CertificatesView(),
      binding: CertificatesBinding(),
    ),
    GetPage(
      name: AppRoutes.CONTACT,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
  ];
}
