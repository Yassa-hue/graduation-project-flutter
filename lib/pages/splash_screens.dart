import 'package:flutter/material.dart';
import 'package:graduationproject/components/splash_screen.dart';
import 'package:graduationproject/pages/login_page.dart';
import 'package:graduationproject/utils/images_paths.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  final PageController _pageController = PageController();

  void _onNextPage(int index) {
    if (index < 2) {
      _pageController.animateToPage(index + 1,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          SplashScreen(
            imagePath: ImagesPaths.splash1,
            title: "Empower Communities",
            description:
                "Join hands with organizations to create lasting change in society.",
            currentIndex: 0,
            onNext: () => _onNextPage(0),
          ),
          SplashScreen(
            imagePath: ImagesPaths.splash2,
            title: "Unite for a Cause",
            description: "Your skills and time can make a world of difference.",
            currentIndex: 1,
            onNext: () => _onNextPage(1),
          ),
          SplashScreen(
            imagePath: ImagesPaths.splash3,
            title: "Transform Lives",
            description:
                "Every effort counts towards building a better community.",
            currentIndex: 2,
            onNext: () => _onNextPage(2),
          ),
        ],
      ),
    );
  }
}
