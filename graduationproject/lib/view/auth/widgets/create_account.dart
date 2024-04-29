import 'package:flutter/material.dart';
import '../../../model/model_pic.dart';
import '../../component/custom_button.dart';
import '../../component/custom_field.dart';

class CreateAcount extends StatefulWidget {
  const CreateAcount({super.key});

  @override
  State<CreateAcount> createState() => _CreateAcountState();
}

class _CreateAcountState extends State<CreateAcount> {
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                      color: primarycolor),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomField(
                    text: "Create account",
                    hiinttext: "User name",
                    prefex: Icons.person),
                CustomField(
                  text: "Email",
                  hiinttext: "ys198@mail.com",
                  prefex: Icons.email,
                ),
                CustomField(
                    text: "Password",
                    hiinttext: "Password",
                    prefex: Icons.lock_person,
                    suffex: Icons.visibility_off),
                CustomField(
                  text: "Confirm Password",
                  hiinttext: "Confirm Password",
                  prefex: Icons.lock_person,
                  suffex: Icons.visibility_off,
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
                      side: BorderSide(
                          color: primarycolor,
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
                          color: primarycolor, fontWeight: FontWeight.bold),
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
