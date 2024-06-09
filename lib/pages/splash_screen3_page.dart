import 'package:flutter/material.dart';
import 'package:graduationproject/pages/login_page.dart';
import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/components/splash_screen.dart';

class Splash3 extends StatelessWidget {
  const Splash3({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      imagePath: ImagesPaths.splash3,
      title: "Be a Part of Change",
      description:
          "Through volunteering and helping, you contribute to improving the lives of others and the development of your community.",
      currentIndex: 2,
      onNext: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
    );
  }
}
