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
      title: "Transform Lives",
      description: "Every effort counts towards building a better community.",
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
