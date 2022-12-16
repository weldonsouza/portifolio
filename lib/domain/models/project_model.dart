class ProjectModel {
  final String? title;
  final String? description;
  final List<String>? duration;
  final String? link;

  ProjectModel({
    this.title,
    this.description,
    this.duration,
    this.link,
  });

  ProjectModel.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        description = json['description'] as String?,
        duration = (json['duration'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        link = json['link'] as String?;

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'duration': duration,
        'link': link,
      };
}
