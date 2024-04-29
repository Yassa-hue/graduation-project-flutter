import 'package:flutter/material.dart';
import 'package:graduationproject/model/model_pic.dart';
import 'package:graduationproject/view/component/custom_smooth_indicator.dart';

class Splash3 extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);
  const Splash3({super.key});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Center(child: Image.asset(AssetModel.splash3)),
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
              "Throw volunteering and helping , you contribute to improving the lives of others and the development of your community.",
              style: TextStyle(color: primarycolor, fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FloatingActionButton(
              backgroundColor: primarycolor,
              onPressed: () {},
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
              CustomDotIndicator(isActive: false),
              SizedBox(
                width: 10,
              ),
              CustomDotIndicator(isActive: false),
              SizedBox(
                width: 10,
              ),
              CustomDotIndicator(isActive: true),
            ],
          )
        ]),
      ),
    ));
  }
}
