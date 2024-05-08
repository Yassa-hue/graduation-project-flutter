import 'package:cloud_firestore/cloud_firestore.dart';

class Campaign {
  String _id;
  final String coverImageLink;
  final String title;
  final String description;
  final DateTime createdAt;
  final String organizationId; // New property

  Campaign({
    required String id,
    required this.coverImageLink,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.organizationId,
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
      organizationId: json['organizationId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'coverImageLink': coverImageLink,
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toIso8601String(),
      'organizationId': organizationId,
    };
  }
}
