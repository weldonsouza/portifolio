/// Modelo de projeto em destaque.
class FeaturedProjectModel {
  const FeaturedProjectModel({
    required this.title,
    required this.description,
    required this.tags,
    required this.imageAsset,
    this.playStoreUrl,
    this.appStoreUrl,
    this.githubUrl,
    this.websiteUrl,
  });

  final String title;
  final String description;
  final List<String> tags;
  final String imageAsset;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? githubUrl;
  final String? websiteUrl;
}
