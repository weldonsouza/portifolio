/// Modelo de experiência profissional.
class ExperienceModel {
  const ExperienceModel({
    required this.period,
    required this.role,
    required this.company,
    required this.description,
    required this.tags,
  });

  final String period;
  final String role;
  final String company;
  final String description;
  final List<String> tags;
}
