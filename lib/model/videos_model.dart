import 'package:flutter/material.dart';

class VideosModel {
  final String name;
  final String category;
  final String url;
  final bool isCompleted;

  VideosModel({
    required this.name,
    required this.category,
    required this.url,
    this.isCompleted = false,
  });

  // You can add a factory method to convert a JSON map to a VideosModel
  factory VideosModel.fromJson(Map<String, dynamic> json) {
    return VideosModel(
      name: json['name'],
      category: json['category'],
      url: json['url'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  // You can also add a toJson method to convert a VideosModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'url': url,
      'isCompleted': isCompleted,
    };
  }
}
