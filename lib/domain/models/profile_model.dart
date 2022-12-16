import 'links_model.dart';
import 'project_model.dart';
import 'recommendation_model.dart';
import 'skill_model.dart';

class ProfileModel {
  final String? photo;
  final String? name;
  final String? description;
  final String? residence;
  final String? city;
  final String? country;
  final int? age;
  final List<SkillModel>? skills;
  final List<SkillModel>? coding;
  final List<String>? knowledge;
  final List<LinksModel>? links;
  final int? subscribers;
  final int? videos;
  final int? stars;
  final List<ProjectModel>? projects;
  final List<RecommendationModel>? recommendation;

  ProfileModel({
    this.photo,
    this.name,
    this.description,
    this.residence,
    this.city,
    this.country,
    this.age,
    this.skills,
    this.coding,
    this.knowledge,
    this.links,
    this.subscribers,
    this.videos,
    this.stars,
    this.projects,
    this.recommendation,
  });

  ProfileModel.fromJson(Map<String, dynamic> json)
      : photo = json['photo'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        residence = json['residence'] as String?,
        city = json['city'] as String?,
        country = json['country'] as String?,
        age = json['age'] as int?,
        skills = (json['skills'] as List?)?.map((dynamic e) => e as SkillModel).toList(),
        coding = (json['coding'] as List?)?.map((dynamic e) => e as SkillModel).toList(),
        knowledge = (json['knowledge'] as List?)?.map((dynamic e) => e as String).toList(),
        links = (json['links'] as List?)?.map((dynamic e) => e as LinksModel).toList(),
        subscribers = json['subscribers'] as int?,
        videos = json['videos'] as int?,
        stars = json['stars'] as int?,
        projects = (json['projects'] as List?)?.map((dynamic e) => e as ProjectModel).toList(),
        recommendation = (json['recommendation'] as List?)?.map((dynamic e) => e as RecommendationModel).toList();

  Map<String, dynamic> toJson() => {
        'photo': photo,
        'name': name,
        'description': description,
        'residence': residence,
        'city': city,
        'country': country,
        'age': age,
        'skills': skills,
        'coding': coding,
        'knowledge': knowledge,
        'links': links,
        'subscribers': subscribers,
        'videos': videos,
        'stars': stars,
        'projects': projects,
        'recommendation': recommendation,
      };
}
