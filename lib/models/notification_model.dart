import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  String? id;
  final String title;
  final String body;
  String userId;
  final DateTime createdAt;

  NotificationModel({
    this.id,
    required this.title,
    required this.body,
    required this.userId,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory NotificationModel.fromJson(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      userId: map['userId'],
      createdAt: (map["createdAt"] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'userId': userId,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
