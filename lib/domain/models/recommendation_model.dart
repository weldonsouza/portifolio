class RecommendationModel {
  final String? name;
  final String? source;
  final String? text;

  RecommendationModel({
    this.name,
    this.source,
    this.text,
  });

  RecommendationModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        source = json['source'] as String?,
        text = json['text'] as String?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'source': source,
        'text': text,
      };
}
