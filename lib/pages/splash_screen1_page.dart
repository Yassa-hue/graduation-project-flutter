import 'package:flutter/material.dart';
import 'package:graduationproject/pages/page_manager.dart';
import 'package:graduationproject/pages/splash_screen2_page.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/utils/constants.dart';
import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/components/splash_screen.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    if (AuthProvider.of(context)!.currentUser != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainPage(currentPage: homePage)),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      imagePath: ImagesPaths.splash1,
      title: "Empower Communities",
      description:
          "Join hands with organizations to create lasting change in society.",
      currentIndex: 0,
      onNext: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Splash2()),
        );
      },
    );
  }
}
