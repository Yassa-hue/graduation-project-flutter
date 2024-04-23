import 'package:flutter/material.dart';
import 'package:graduationproject/model/model_pic.dart';
import 'package:graduationproject/view/component/custom_smooth_indicator.dart';

class Splash2 extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);

  // ignore: prefer_const_constructors_in_immutables
  Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            color: primarycolor,
            height: 400,
            child: Image.asset(AssetModel.introo),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "    Be a Part of Change ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: primarycolor),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Volunteering and assisting are among the most beautiful acts that a person can undertake.",
              style: TextStyle(color: primarycolor, fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: FloatingActionButton(
              backgroundColor: primarycolor,
              onPressed: () {},
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
