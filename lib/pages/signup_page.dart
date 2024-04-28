import 'package:flutter/material.dart';

import '../../../utils/images_paths.dart';
import '../utils/color_palette.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 40),
                    height: 250,
                    child: Image.asset(
                      ImagesPaths.undraw,
                      width: 210,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Create account',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: PRIMARY_COLOR),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomField(
                    text: "Create account",
                    hiinttext: "User name",
                    prefex: Icons.person,
                    onChanged: (value) => {},
                ),
                CustomField(
                  text: "Email",
                  hiinttext: "ys198@mail.com",
                  prefex: Icons.email,
                  onChanged: (value) => {},
                ),
                CustomField(
                    text: "Password",
                    hiinttext: "Password",
                    prefex: Icons.lock_person,
                    suffex: Icons.visibility_off,
                    onChanged: (value) => {},
                ),
                CustomField(
                  text: "Confirm Password",
                  hiinttext: "Confirm Password",
                  prefex: Icons.lock_person,
                  suffex: Icons.visibility_off,
                  onChanged: (value) => {},
                ),
                Row(
                  children: [
                    Checkbox(
                      value: status,
                      onChanged: (val) {
                        setState(() {
                          status = val!;
                        });
                      },
                      side: const BorderSide(
                          color: PRIMARY_COLOR,
                          style: BorderStyle.solid,
                          width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    const Text(
                      "I agree to the ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'terms & conditions',
                      style: TextStyle(
                          color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  title: "Sign in",
                )
              ]),
        ),
      ),
    );
  }
}
