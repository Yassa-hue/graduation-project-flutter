import 'package:flutter/material.dart';
import 'package:graduationproject/pages/home_page.dart';
import 'package:graduationproject/utils/AuthProvider.dart';

import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/utils/color_palette.dart';

import 'package:graduationproject/components/custom_button.dart';
import 'package:graduationproject/components/custom_field.dart';
import 'package:graduationproject/utils/utils.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

// TODO: Add loading animation and error messages
class _SignupPageState extends State<SignupPage> {
  bool agreeToTermsAndConditions = false;
  bool loading = false;
  String error = "";
  String username = "",
      email = "",
      password = "",
      confirmPassword = "";
  
  Future<void> signup() async {
    final auth = AuthProvider.of(context)!;
    setState(() {
      loading = true;
      error = "";
    });

    try {
      if (password != confirmPassword) {
        throw "Passwords do not match";
      }

      await auth.signup({
        "name": username,
        "email": email,
        "password": password,
      });
      final route = MaterialPageRoute(builder: (context) => const HomePage());
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(route);
    } catch (e) {
      setState(() => error = e.toString());
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DismissKeyboardOnTap(
        child: Container(
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
                      onChanged: (value) => {
                        setState(() {
                          username = value;
                        })
                      },
                  ),
                  CustomField(
                    text: "Email",
                    hiinttext: "ys198@mail.com",
                    prefex: Icons.email,
                    onChanged: (value) => {
                      setState(() {
                        email = value;
                      })
                    },
                  ),
                  CustomField(
                      text: "Password",
                      hiinttext: "Password",
                      prefex: Icons.lock_person,
                      suffex: Icons.visibility_off,
                      onChanged: (value) => {
                        setState(() {
                          password = value;
                        })
                      },
                  ),
                  CustomField(
                    text: "Confirm Password",
                    hiinttext: "Confirm Password",
                    prefex: Icons.lock_person,
                    suffex: Icons.visibility_off,
                    onChanged: (value) => {
                      setState(() {
                        confirmPassword = value;
                      })
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: agreeToTermsAndConditions,
                        onChanged: (val) {
                          setState(() {
                            agreeToTermsAndConditions = val!;
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
                  CustomButton( // TODO: Add disabled behavior
                    title: "Sign in",
                    onTap: () => signup(),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
