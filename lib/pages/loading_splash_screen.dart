import 'package:flutter/material.dart';
import 'package:graduationproject/utils/color_palette.dart';

class LoadingSplashScreen extends StatelessWidget {
  const LoadingSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
