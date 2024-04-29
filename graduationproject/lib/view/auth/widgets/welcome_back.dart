import 'package:flutter/material.dart';
import '../../../model/model_pic.dart';
import '../../component/custom_button.dart';
import '../../component/custom_field.dart';

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
                      child: Image.asset(
                        AssetModel.undraw,
                        width: 210,
                        fit: BoxFit.cover,
                      ),
                      height: 250,
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
                        prefex: Icons.email),
                    CustomField(
                      text: "Password",
                      hiinttext: "********",
                      prefex: Icons.lock_person,
                      suffex: Icons.visibility_off,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: status,
                          onChanged: (val) {},
                          side: BorderSide(
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
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
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
                      title: "Login",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomButton(title: "Signup")
                  ]),
            )));
  }
}
