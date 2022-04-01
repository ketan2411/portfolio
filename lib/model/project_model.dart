// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProjectModel {
  final String title;
  final String? subtitle;
  final String? link;
  final String description;
  final String year;
  final List<String> tags;
  final List<String> screenshots;
  ProjectModel({
    required this.title,
    this.subtitle,
    this.link,
    required this.description,
    required this.year,
    required this.tags,
    required this.screenshots,
  });

  ProjectModel copyWith({
    String? title,
    String? subtitle,
    String? link,
    String? description,
    String? year,
    List<String>? tags,
    List<String>? screenshots,
  }) {
    return ProjectModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      link: link ?? this.link,
      description: description ?? this.description,
      year: year ?? this.year,
      tags: tags ?? this.tags,
      screenshots: screenshots ?? this.screenshots,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'link': link,
      'description': description,
      'year': year,
      'tags': tags,
      'screenshots': screenshots,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
        title: map['title'] as String,
        subtitle: map['subtitle'] != null ? map['subtitle'] as String : null,
        link: map['link'] != null ? map['link'] as String : null,
        description: map['description'] as String,
        year: map['year'] as String,
        tags: List<String>.from((map['tags'] as List<dynamic>)),
        screenshots: List<String>.from((map['screenshots'] as List<dynamic>)));
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) =>
      ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProjectModel(title: $title, subtitle: $subtitle, link: $link, description: $description, year: $year, tags: $tags, screenshots: $screenshots)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectModel &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.link == link &&
        other.description == description &&
        other.year == year &&
        listEquals(other.tags, tags) &&
        listEquals(other.screenshots, screenshots);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subtitle.hashCode ^
        link.hashCode ^
        description.hashCode ^
        year.hashCode ^
        tags.hashCode ^
        screenshots.hashCode;
  }
}
