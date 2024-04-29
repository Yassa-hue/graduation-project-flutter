import 'package:flutter/material.dart';

import '../../../model/model_pic.dart';
import '../../component/custom_button.dart';
import '../../component/custom_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  static const primarycolor = Color(0xff644AE5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset(
                  AssetModel.forgetpass,
                  width: 320,
                  fit: BoxFit.cover,
                ),
                height: 250,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Forget Password',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: primarycolor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Please Enter your mail ',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomField(
              text: "Forget Passord",
              hiinttext: "Email",
              prefex: Icons.email,
            ),
            const SizedBox(
              height: 60,
            ),
            CustomButton(
              title: "Continue",
            )
          ]),
        ),
      ),
    );
  }
}
