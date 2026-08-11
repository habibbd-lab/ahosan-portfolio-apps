import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/service_model.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../../widgets/modal_dialog.dart';

class ServicesController extends GetxController {
  final PortfolioRepository repository = PortfolioRepository();

  late final List<ServiceModel> services;

  @override
  void onInit() {
    super.onInit();
    services = repository.getServices();
  }

  void showServiceDetails(ServiceModel service) {
    ModalDialog.show(
      title: service.title,
      subtitle: "Estimated Timeline: ${service.estimatedTimeline}",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(service.description, style: const TextStyle(color: Colors.white, fontSize: 15)),
          const SizedBox(height: 16),
          const Text("⭐ Key Features & Benefits", style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...service.keyFeatures.map((f) => Text("• $f", style: const TextStyle(color: Colors.white70))),
          const SizedBox(height: 16),
          const Text("⚙️ Development Process", style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...service.developmentProcess.map((p) => Text(p, style: const TextStyle(color: Colors.white70))),
          const SizedBox(height: 16),
          const Text("📦 Deliverables", style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...service.deliverables.map((d) => Text("• $d", style: const TextStyle(color: Colors.white70))),
        ],
      ),
    );
  }
}
