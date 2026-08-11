class ServiceModel {
  final String id;
  final String title;
  final String description;
  final String estimatedTimeline;
  final List<String> keyFeatures;
  final List<String> developmentProcess;
  final List<String> technologiesUsed;
  final List<String> deliverables;
  final List<Map<String, String>> faqs;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.estimatedTimeline,
    required this.keyFeatures,
    required this.developmentProcess,
    required this.technologiesUsed,
    required this.deliverables,
    required this.faqs,
  });
}
