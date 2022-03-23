// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShowcaseModel {
  final String title;
  final String subtitle;
  final String routeName;
  final String image;
  ShowcaseModel({
    required this.title,
    required this.subtitle,
    required this.routeName,
    required this.image,
  });


  ShowcaseModel copyWith({
    String? title,
    String? subtitle,
    String? routeName,
    String? image,
  }) {
    return ShowcaseModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      routeName: routeName ?? this.routeName,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'routeName': routeName,
      'image': image,
    };
  }

  factory ShowcaseModel.fromMap(Map<String, dynamic> map) {
    return ShowcaseModel(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      routeName: map['routeName'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShowcaseModel.fromJson(String source) => ShowcaseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShowcaseModel(title: $title, subtitle: $subtitle, routeName: $routeName, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ShowcaseModel &&
      other.title == title &&
      other.subtitle == subtitle &&
      other.routeName == routeName &&
      other.image == image;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      subtitle.hashCode ^
      routeName.hashCode ^
      image.hashCode;
  }
}
