class ProjectModel {
  final String id;
  final String title;
  final String category; // 'Flutter', 'Web', 'Graphic Design', 'AI', 'Video Editing', 'Digital Marketing', 'DevOps'
  final String description;
  final String fullDetails;
  final String? imageUrl;
  final List<String> tags;
  final String status; // 'LIVE', 'COMPLETED', 'ACTIVE LAB', 'READY'
  final bool isFeatured;
  final String? githubUrl;
  final String? liveDemoUrl;
  final String? caseStudyUrl;
  final bool isFlutterApp;
  final String? apkDownloadUrl;

  ProjectModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.fullDetails,
    this.imageUrl,
    required this.tags,
    required this.status,
    this.isFeatured = false,
    this.githubUrl,
    this.liveDemoUrl,
    this.caseStudyUrl,
    this.isFlutterApp = false,
    this.apkDownloadUrl,
  });
}
