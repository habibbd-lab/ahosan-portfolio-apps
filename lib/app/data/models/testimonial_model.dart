class TestimonialModel {
  final String id;
  final String quote;
  final String authorName;
  final String authorTitle;
  final String authorCompany;
  final String initials;
  final int ratingStars;

  TestimonialModel({
    required this.id,
    required this.quote,
    required this.authorName,
    required this.authorTitle,
    required this.authorCompany,
    required this.initials,
    this.ratingStars = 5,
  });
}
