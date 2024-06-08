import 'package:graduationproject/models/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationproject/models/user_model.dart';

class NotificationService {
  final CollectionReference _colectionReference =
      FirebaseFirestore.instance.collection('notifications');

  Future<NotificationModel> createNotification(
      NotificationModel notification) async {
    DocumentReference docRef =
        await _colectionReference.add(notification.toJson());
    String id = docRef.id;
    await docRef.update({'id': id});

    notification.id = id;
    return notification;
  }

  Future<NotificationModel> getNotificationById(String id) async {
    DocumentSnapshot snapshot = await _colectionReference.doc(id).get();
    if (snapshot.exists) {
      return NotificationModel.fromJson(
          snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('Notification not found');
    }
  }

  Future<void> updateNotification(NotificationModel notification) async {
    await _colectionReference
        .doc(notification.id)
        .update(notification.toJson());
  }

  Future<void> deleteNotification(String id) async {
    await _colectionReference.doc(id).delete();
  }

  Future<List<NotificationModel>>? getNotificationsByUser(String userId) async {
    QuerySnapshot snapshot =
        await _colectionReference.where('userId', isEqualTo: userId).get();

    return snapshot.docs
        .map((doc) =>
            NotificationModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> sendNotificationToUsersByType(
      NotificationModel notification, UserRole userRole) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: userRole.toString().split('.').last)
        .get();

    List<String> userIds = snapshot.docs.map((doc) => doc.id).toList();

    for (String userId in userIds) {
      notification.userId = userId;
      await createNotification(notification);
    }
  }
}
