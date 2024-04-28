import 'package:cloud_firestore/cloud_firestore.dart';

class Campaign {
  final String coverImageLink;
  final String title;
  final String description;
  final DateTime createdAt;

  Campaign({
    required this.coverImageLink,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      coverImageLink: json['coverImageLink'],
      title: json['title'],
      description: json['description'],
      createdAt: (json["createdAt"] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coverImageLink': coverImageLink,
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
}
