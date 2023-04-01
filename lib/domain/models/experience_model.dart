class ExperienceModel {
  ExperienceModel({
    required this.title,
    required this.titleUrl,
    this.subtitle,
    required this.body,
    required this.location,
    required this.duration,
  });

  final String title;
  final String titleUrl;
  final String location;
  final String duration;
  final String? subtitle;
  final List<String> body;
}
