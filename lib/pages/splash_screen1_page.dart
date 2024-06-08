import 'package:flutter/material.dart';
import 'package:graduationproject/pages/page_manager.dart';
import 'package:graduationproject/pages/splash_screen2_page.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/constants.dart';
import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/components/custom_smooth_indicator.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    if (AuthProvider.of(context)!.currentUser != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage(currentPage: homePage,)));
      });
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Container(
                color: PRIMARY_COLOR,
                height: 500,
                width: double.infinity,
                child: Center(
                    child: Image.asset(
                  ImagesPaths.splash1,
                  fit: BoxFit.cover,
                ))),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "    Be a Part of Change ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: PRIMARY_COLOR),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Conects you with organizations and individuals in need of your assistance.",
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
                    MaterialPageRoute(builder: (context) => Splash2()));
              },
              child: const Icon(
                Icons.navigate_next_outlined,
                size: 50,
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
              CustomDotIndicator(isActive: true),
              SizedBox(
                width: 10,
              ),
              CustomDotIndicator(isActive: false),
              SizedBox(
                width: 10,
              ),
              CustomDotIndicator(isActive: false),
            ],
          )
        ]),
      ),
    );
  }
}
