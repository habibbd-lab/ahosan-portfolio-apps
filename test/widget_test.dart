import 'package:flutter_test/flutter_test.dart';
import 'package:ahosan_portfolio/app/data/repositories/portfolio_repository.dart';

void main() {
  test('PortfolioRepository loads dataset correctly', () {
    final repository = PortfolioRepository();

    final projects = repository.getProjects();
    expect(projects.isNotEmpty, true);

    final featured = repository.getFeaturedProjects();
    expect(featured.length, 3);

    final flutterApps = repository.getFlutterApps();
    expect(flutterApps.length, 12);

    final skills = repository.getSkills();
    expect(skills.length, 13);

    final certificates = repository.getCertificates();
    expect(certificates.length, 13);

    final services = repository.getServices();
    expect(services.length, 9);
  });
}
