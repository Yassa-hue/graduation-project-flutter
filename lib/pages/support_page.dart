import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/models/notification_model.dart';
import 'package:graduationproject/services/notification_service.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

  Future<void> sendSupportRequestToFirestore(
      String subject, String message, String userId) async {
    CollectionReference supportRequests =
        FirebaseFirestore.instance.collection('support_requests');

    DocumentReference docRef = await supportRequests.add({
      'subject': subject,
      'message': message,
      'userId': userId,
      'createdAt': Timestamp.now(),
    });

    await docRef.update({'id': docRef.id});
  }

  Future<void> _submitSupportRequest() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final auth = AuthProvider.of(context)!;
        final currentUser = auth.currentUser!;
        final notificationService = NotificationService();

        final notification = NotificationModel(
          title: 'Support Request',
          body:
              'Subject: ${_subjectController.text}\nMessage: ${_messageController.text}',
          userId: currentUser.id,
        );

        await notificationService.createNotification(notification);

        // Send the support request to Firestore
        await sendSupportRequestToFirestore(
            _subjectController.text, _messageController.text, currentUser.id);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Your request has been submitted successfully. Please check your email for a response.')),
        );

        _subjectController.clear();
        _messageController.clear();

        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Failed to submit request. Please try again later.')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
        backgroundColor: PRIMARY_COLOR,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Support Request',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: PRIMARY_COLOR,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _subjectController,
                decoration: InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a subject';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  labelText: 'Message',
                  alignLabelWithHint: true, // Aligns the label with the hint
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(
                      12, 30, 12, 0), // Adjust padding as needed
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitSupportRequest,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PRIMARY_COLOR,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
