import 'package:flutter/material.dart';
import '../../../model/model_pic.dart';
import '../../component/custom_button.dart';
import '../../component/custom_field.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});
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
                  AssetModel.forget,
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
              'Change Password',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: primarycolor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Please Enter New Pasword ',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomField(
              text: "New Password",
              hiinttext: "Pasword",
              prefex: Icons.lock_person,
              suffex: Icons.visibility_off,
            ),
            CustomField(
              text: "Confirm New Pasword",
              hiinttext: "Pasword",
              prefex: Icons.lock_person,
              suffex: Icons.visibility_off,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              title: "Submit",
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\'t received Code?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Send again ',
                  style: TextStyle(
                      color: primarycolor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
