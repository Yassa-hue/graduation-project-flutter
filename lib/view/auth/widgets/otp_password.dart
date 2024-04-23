import 'package:flutter/material.dart';
import 'package:graduationproject/model/model_pic.dart';
import 'package:graduationproject/view/component/custom_button.dart';
import 'package:graduationproject/view/component/custom_otp.dart';

class OtpPassword extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);

  const OtpPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(AssetModel.otpsecurity),
              const Text(
                'Forget Password',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: primarycolor),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Please Enter OTP Password  ',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OTP(),
                  const SizedBox(
                    width: 9,
                  ),
                  OTP(),
                  const SizedBox(
                    width: 9,
                  ),
                  OTP(),
                  const SizedBox(
                    width: 9,
                  ),
                  OTP(),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(title: "Submit"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't received code? ",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Send again ",
                        style: TextStyle(
                            color: primarycolor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ]),
          )),
    );
  }
}
