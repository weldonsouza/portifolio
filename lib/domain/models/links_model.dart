class LinksModel {
  final String? name;
  final String? link;

  LinksModel({
    this.name,
    this.link,
  });

  LinksModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        link = json['link'] as String?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'link': link,
      };
}
