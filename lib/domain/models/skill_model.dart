class SkillModel {
  final String? name;
  final double? percentage;

  SkillModel({
    this.name,
    this.percentage,
  });

  SkillModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        percentage = json['percentage'] as double?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'percentage': percentage,
      };
}
