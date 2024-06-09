import 'package:flutter/material.dart';
import 'package:graduationproject/components/custom_smooth_indicator.dart';
import 'package:graduationproject/utils/color_palette.dart';

class SplashScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final int currentIndex;
  final VoidCallback onNext;

  const SplashScreen({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.currentIndex,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Center(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: PRIMARY_COLOR,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: const TextStyle(color: PRIMARY_COLOR, fontSize: 17),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: FloatingActionButton(
                backgroundColor: PRIMARY_COLOR,
                onPressed: onNext,
                child: const Icon(
                  Icons.navigate_next_outlined,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CustomDotIndicator(isActive: currentIndex == index),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
