/// Modelo de projeto em destaque.
class FeaturedProjectModel {
  const FeaturedProjectModel({
    required this.title,
    required this.description,
    required this.tags,
    required this.imageAsset,
  });

  final String title;
  final String description;
  final List<String> tags;
  final String imageAsset;
}
