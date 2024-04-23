import 'package:flutter/material.dart';
import 'package:graduationproject/model/model_pic.dart';
import 'package:graduationproject/view/component/custom_smooth_indicator.dart';

class Splash1 extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);

  const Splash1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Container(
                color: primarycolor,
                height: 500,
                width: double.infinity,
                child: Center(
                    child: Image.asset(
                  AssetModel.splash1,
                  fit: BoxFit.cover,
                ))),
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
              "Conects you with organizations and individuals in need of your assistance.",
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
