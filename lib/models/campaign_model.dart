import 'package:cloud_firestore/cloud_firestore.dart';

class Campaign {
  String _id;
  final String coverImageLink;
  final String title;
  final String description;
  final DateTime createdAt;

  Campaign({
    required String id,
    required this.coverImageLink,
    required this.title,
    required this.description,
    required this.createdAt,
  }) : _id = id;

  set id(String value) {
    _id = value;
  }

  String get id {
    return _id;
  }

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      id: json['id'],
      coverImageLink: json['coverImageLink'],
      title: json['title'],
      description: json['description'],
      createdAt: (json["createdAt"] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'coverImageLink': coverImageLink,
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
}
