class ContactFormModel {
  String name;
  String email;
  String phone;
  String company;
  String service;
  String budget;
  String subject;
  String message;
  bool agreeTerms;

  ContactFormModel({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.company = '',
    this.service = 'Flutter Mobile App Development',
    this.budget = '\$500 - \$1,500 (Standard)',
    this.subject = '',
    this.message = '',
    this.agreeTerms = false,
  });
}
