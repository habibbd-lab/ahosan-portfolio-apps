class CertificateModel {
  final String id;
  final String title;
  final String institute;
  final String date;
  final String credentialId;
  final String category; // 'Professional Certificates', 'Training', 'Milestones', 'Future Certifications'
  final String description;
  final List<String> skills;
  final bool isVerified;
  final bool isFuturePlanned;

  CertificateModel({
    required this.id,
    required this.title,
    required this.institute,
    required this.date,
    required this.credentialId,
    required this.category,
    required this.description,
    required this.skills,
    this.isVerified = true,
    this.isFuturePlanned = false,
  });
}
