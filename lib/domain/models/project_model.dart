class ProjectModel {
  final String? title;
  final String? description;
  final List<String>? duration;
  final String? banner;
  final String? typeProject;
  final String? linkPackage;
  final String? linkGooglePlay;
  final String? linkAppPlay;
  final String? linkGithub;

  const ProjectModel({
    required this.title,
    this.description,
    this.duration,
    this.banner,
    this.typeProject,
    this.linkPackage,
    this.linkGooglePlay,
    this.linkAppPlay,
    this.linkGithub,
  });
}