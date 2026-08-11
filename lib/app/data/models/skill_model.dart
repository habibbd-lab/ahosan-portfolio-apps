class SkillModel {
  final String id;
  final String name;
  final String category; // 'Mobile Dev', 'Web Dev', 'Version Control', 'Graphic Design', 'Video Editing', 'Marketing', 'AI Tools', 'DevOps (Learning)'
  final int percentage;
  final String level; // 'PROFESSIONAL', 'ADVANCED', 'INTERMEDIATE'
  final String description;
  final String details;
  final bool isTopFeatured;

  SkillModel({
    required this.id,
    required this.name,
    required this.category,
    required this.percentage,
    required this.level,
    required this.description,
    required this.details,
    this.isTopFeatured = false,
  });
}
