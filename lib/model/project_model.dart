import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProjectModel {
  final String title;
  final String? subtitle;
  final String? link;
  final String description;
  final String year;
  final List<String> screenshots;
  final String routeName;
  ProjectModel({
    required this.title,
    this.subtitle,
    this.link,
    required this.description,
    required this.year,
    required this.screenshots,
    required this.routeName,
  });

  ProjectModel copyWith({
    String? title,
    String? subtitle,
    String? link,
    String? description,
    String? year,
    List<String>? screenshots,
    String? routeName,
  }) {
    return ProjectModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      link: link ?? this.link,
      description: description ?? this.description,
      year: year ?? this.year,
      screenshots: screenshots ?? this.screenshots,
      routeName: routeName ?? this.routeName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'link': link,
      'description': description,
      'year': year,
      'screenshots': screenshots,
      'routeName': routeName,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      title: map['title'] ?? '',
      subtitle: map['subtitle'],
      link: map['link'],
      description: map['description'] ?? '',
      year: map['year'] ?? '',
      screenshots: List<String>.from(map['screenshots']),
      routeName: map['routeName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) =>
      ProjectModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProjectModel(title: $title, subtitle: $subtitle, link: $link, description: $description, year: $year, screenshots: $screenshots, routeName: $routeName)';
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
      listEquals(other.screenshots, screenshots) &&
      other.routeName == routeName;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      subtitle.hashCode ^
      link.hashCode ^
      description.hashCode ^
      year.hashCode ^
      screenshots.hashCode ^
      routeName.hashCode;
  }
}
