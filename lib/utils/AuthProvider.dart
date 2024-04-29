import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends StatefulWidget {
  final Widget child;
  const AuthProvider({Key? key, required this.child}) : super(key: key);

  @override
  State<AuthProvider> createState() => _AuthProviderState();

  static _AuthProviderState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AuthProviderState>();
}

class _AuthProviderState extends State<AuthProvider> {
  UserModel? currentUser;
  bool initialized = false;
  late final SharedPreferences prefs;
  late final FirebaseFirestore firestore;
  late final List<String> conditions;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) async {
      await Firebase.initializeApp();
      firestore = FirebaseFirestore.instance;
      prefs = await SharedPreferences.getInstance();

      if (prefs.containsKey('user_id')) {
        final userDoc = await firestore
            .collection('users')
            .doc(prefs.getString('user_id'))
            .get();
        if (userDoc.exists) {
          currentUser = UserModel.fromJson(userDoc.data()!);
        }
      }
      updateFcmToken();
      setState(() {
        initialized = true;
      });
    });
  }

  Future<void> login(String email, String password) async {
    final res = await firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();
    if (res.size == 0) {
      throw "Invalid Email or Password";
    }
    await prefs.setString('user_id', res.docs[0].id);
    setState(() {
      currentUser = UserModel.fromJson(res.docs[0].data());
    });
    updateFcmToken();
  }

  Future<void> signup(userData) async {
    final res = await firestore
        .collection('users')
        .where('email', isEqualTo: userData["email"])
        .get();
    if (res.size > 0) {
      throw "Email you entered already exists";
    }

    if (userData["password"].length < 6) {
      throw "Weak password, password must be at least 6 characters long";
    }

    final userRef = firestore.collection('users').doc();
    await userRef.set(userData);
    await prefs.setString('user_id', userRef.id);
    setState(() {
      currentUser = UserModel.fromJson(userData);
    });
    updateFcmToken();
  }

  Future<void> updateUser(Map<String, dynamic> updates) async {
    final userDoc = firestore.collection('users').doc(currentUser!.id);
    await userDoc.update(updates);
    currentUser = UserModel.fromJson((await userDoc.get()).data()!);
    setState(() {});
  }

  Future<void> updateFcmToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      print("FCM Token: $token");
      if (token == null) {
        print("No FCM Token Found");
        return;
      }
      await firestore.collection('fcm_tokens').doc(token).set({
        'user_id': currentUser?.id,
        'updated_at': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error while updating token: $e");
    }
  }

  Future<void> logout() async {
    setState(() {
      currentUser = null;
    });
    await prefs.clear();
    updateFcmToken();
  }

  @override
  Widget build(BuildContext context) {
    return initialized ? widget.child : Container();
  }
}
