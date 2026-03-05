/// Modelo de projeto (outros projetos).
class ProjectModel {
  const ProjectModel({
    required this.title,
    required this.description,
    required this.tags,
    required this.type,
  });

  final String title;
  final String description;
  final List<String> tags;
  final String type;
}
