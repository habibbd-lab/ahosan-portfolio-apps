import 'package:get/get.dart';
import '../../../data/repositories/portfolio_repository.dart';

class AboutController extends GetxController {
  final PortfolioRepository repository = PortfolioRepository();

  final Map<String, int> devOpsRoadmap = {
    "Linux Admin": 70,
    "Docker & Containers": 55,
    "GitHub Actions": 50,
    "NGINX & SSL": 45,
    "Cloud Basics & VPS": 40,
  };
}
