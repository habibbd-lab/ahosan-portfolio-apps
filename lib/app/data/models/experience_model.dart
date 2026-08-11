class ExperienceModel {
  final String id;
  final String title;
  final String company;
  final String duration;
  final String dateRange;
  final String category; // 'Professional Work', 'Education & Training'
  final String tenureBadge;
  final String description;
  final List<String> responsibilities;
  final List<String> tags;

  ExperienceModel({
    required this.id,
    required this.title,
    required this.company,
    required this.duration,
    required this.dateRange,
    required this.category,
    required this.tenureBadge,
    required this.description,
    required this.responsibilities,
    required this.tags,
  });
}
