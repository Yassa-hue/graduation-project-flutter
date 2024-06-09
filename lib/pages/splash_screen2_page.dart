import 'package:flutter/material.dart';
import 'package:graduationproject/pages/splash_screen3_page.dart';
import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/components/splash_screen.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      imagePath: ImagesPaths.introo,
      title: "Be a Part of Change",
      description:
          "Volunteering and assisting are among the most beautiful acts that a person can undertake.",
      currentIndex: 1,
      onNext: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Splash3()),
        );
      },
    );
  }
}
