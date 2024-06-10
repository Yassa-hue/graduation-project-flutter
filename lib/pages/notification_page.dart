import 'package:flutter/material.dart';
import 'package:graduationproject/components/dissmissable_list.dart';
import 'package:graduationproject/models/notification_model.dart';
import 'package:graduationproject/services/notification_service.dart';
import 'package:graduationproject/utils/AuthProvider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String userId = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      userId = AuthProvider.of(context)!.currentUser!.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<List<NotificationModel>>(
          future: NotificationService().getNotificationsByUser(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<NotificationModel> notifications = snapshot.data!;
              return DismissibleList(
                items: notifications,
                itemBuilder: (context, index, item) {
                  return Card(
                    child: ListTile(
                      title: Text(item.title),
                      subtitle: Text(item.body),
                    ),
                  );
                },
                onDismissed: (index, item) async {
                  await NotificationService().deleteNotification(item.id!);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
