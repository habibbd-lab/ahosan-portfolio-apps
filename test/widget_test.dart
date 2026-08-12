import 'package:flutter_test/flutter_test.dart';
import 'package:ahosan_portfolio/app/data/repositories/portfolio_repository.dart';
import 'package:ahosan_portfolio/app/data/providers/portfolio_data_provider.dart';
import 'package:ahosan_portfolio/app/modules/contact/controllers/contact_controller.dart';

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

  test('PortfolioDataProvider contains valid static email and info', () {
    expect(PortfolioDataProvider.email, 'mdhasanhabibh@gmail.com');
    expect(PortfolioDataProvider.name.isNotEmpty, true);
  });

  test('ContactController builds correct backend-free mailto URI', () {
    final controller = ContactController();
    controller.formModel.name = 'John Doe';
    controller.formModel.email = 'john@example.com';
    controller.formModel.subject = 'Custom Project';
    controller.formModel.message = 'Hello Ahosan';

    final Uri mailtoUri = controller.buildMailtoUri();
    expect(mailtoUri.scheme, 'mailto');
    expect(mailtoUri.path, 'mdhasanhabibh@gmail.com');
    expect(mailtoUri.queryParameters['subject'], 'Custom Project');
    expect(mailtoUri.queryParameters['body']?.contains('John Doe'), true);
    expect(mailtoUri.queryParameters['body']?.contains('Hello Ahosan'), true);
  });
}

