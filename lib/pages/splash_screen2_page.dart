import 'package:flutter/material.dart';
import 'package:graduationproject/pages/splash_screen3_page.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/components/custom_smooth_indicator.dart';

class Splash2 extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            color: PRIMARY_COLOR,
            height: 400,
            child: Image.asset(ImagesPaths.introo),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "    Be a Part of Change ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: PRIMARY_COLOR),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Volunteering and assisting are among the most beautiful acts that a person can undertake.",
              style: TextStyle(color: PRIMARY_COLOR, fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: FloatingActionButton(
              backgroundColor: PRIMARY_COLOR,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Splash3()));
              },
              child: const Icon(
                Icons.navigate_next_outlined,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomDotIndicator(isActive: false),
              SizedBox(
                width: 10,
              ),
              CustomDotIndicator(isActive: true),
              SizedBox(
                width: 10,
              ),
              CustomDotIndicator(isActive: false),
            ],
          )
        ]),
      ),
    ));
  }
}
