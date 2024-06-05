class NotificationModel {
  String? id;
  final String title;
  final String body;
  final String userId;

  NotificationModel({
    this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'userId': userId,
    };
  }
}
