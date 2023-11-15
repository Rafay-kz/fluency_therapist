import 'package:flutter/material.dart';

class VideosModel {
  final String name;
  final String category;
  final String url;
  final double progress;

  VideosModel({
    required this.name,
    required this.category,
    required this.url,
    this.progress = 0.0,
  });

  // You can add a factory method to convert a JSON map to a VideosModel
  factory VideosModel.fromJson(Map<String, dynamic> json) {
    return VideosModel(
      name: json['name'],
      category: json['category'],
      url: json['url'],
      progress: json['progress'] ?? false,
    );
  }

  // You can also add a toJson method to convert a VideosModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'url': url,
      'progress': progress,
    };
  }
}
