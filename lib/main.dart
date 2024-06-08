import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/pages/splash_screen1_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const AuthProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Graduation Project App',
      debugShowCheckedModeBanner: false,
      home: Splash1(),
    );
  }
}
