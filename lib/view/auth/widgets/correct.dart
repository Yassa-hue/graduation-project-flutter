import 'package:flutter/material.dart';
import '../../../utils/images_paths.dart';
import '../../../components/custom_button.dart';

class Correct extends StatelessWidget {
  const Correct({super.key});
  static const primarycolor = Color(0xff644AE5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 40),
                      height: 360,
                      width: 320,
                      child: Image.asset(
                        ImagesPaths.correctp,
                        width: 400,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Congratulation! you password success changd. ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: primarycolor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'Please login to get amazing exprince.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primarycolor),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomButton(
                    title: "Continue",
                  )
                ]),
          )),
    );
  }
}
