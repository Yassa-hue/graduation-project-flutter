import 'package:flutter/material.dart';
import '../../../utils/images_paths.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_field.dart';

// ignore: must_be_immutable
class WelcomeBack extends StatelessWidget {
  WelcomeBack({super.key});
  bool status = false;
  static const primarycolor = Color(0xff644AE5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: primarycolor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomField(
                        text: "Email",
                        hiinttext: "ys198@mail.com",
                        prefex: Icons.email,
                        onChanged: (value) => {},
                        ),
                    CustomField(
                      text: "Password",
                      hiinttext: "********",
                      prefex: Icons.lock_person,
                      suffex: Icons.visibility_off,
                      onChanged: (value) => {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                          value: status,
                          onChanged: (val) {},
                          side: const BorderSide(
                              color: primarycolor,
                              style: BorderStyle.solid,
                              width: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 17),
                        ),
                        const SizedBox(),
                        TextButton(
                          onPressed: () => {},
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primarycolor,
                                fontSize: 17),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      onTap: () => {},
                      title: "Login",
                    )
                  ]),
            )));
  }
}
