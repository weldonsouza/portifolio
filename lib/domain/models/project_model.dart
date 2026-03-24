/// Modelo de projeto (outros projetos).
class ProjectModel {
  const ProjectModel({
    required this.title,
    required this.description,
    required this.tags,
    required this.type,
    this.playStoreUrl,
    this.appStoreUrl,
    this.githubUrl,
    this.websiteUrl,
  });

  final String title;
  final String description;
  final List<String> tags;
  final String type;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? githubUrl;
  final String? websiteUrl;
}
