import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graduationproject/pages/intro_screen.dart';
import 'package:graduationproject/pages/loading_splash_screen.dart';
import 'package:graduationproject/pages/login_page.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const AuthProvider(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _introShown = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _checkIntroScreen();
  }

  Future<void> _checkIntroScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? introShown = prefs.getBool('introShown');
    if (introShown == null || !introShown) {
      setState(() {
        _introShown = false;
        _loading = false;
      });
    } else {
      setState(() {
        _introShown = true;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return MaterialApp(
        home: LoadingSplashScreen(),
      );
    }

    return MaterialApp(
      title: 'Graduation Project App',
      debugShowCheckedModeBanner: false,
      home: _introShown ? LoginPage() : IntroScreen(),
    );
  }
}
