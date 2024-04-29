import 'package:flutter/material.dart';
import 'package:graduationproject/model/model_pic.dart';
import 'package:graduationproject/view/component/custom_button.dart';

// ignore: must_be_immutable
class Options extends StatelessWidget {
  const Options({super.key, this.option1, this.option2, this.option3});
  static const primarycolor = Color(0xff644AE5);
  final String? option1;
  final String? option2;
  final String? option3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 250,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Image.asset(
                    AssetModel.undraw,
                    width: 210,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Sign in as :',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: primarycolor),
              ),
              const SizedBox(
                height: 35,
              ),
              Center(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primarycolor)),
                alignment: Alignment.center,
                width: 300,
                height: 60,
                child: Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Admin",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  Radio(
                      value: "Admin", groupValue: option1, onChanged: (val) {}),
                ]),
              )),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primarycolor)),
                alignment: Alignment.center,
                width: 300,
                height: 60,
                child: Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Volunteer",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    width: 155,
                  ),
                  Radio(
                      value: "Volunteer",
                      groupValue: option2,
                      onChanged: (val) {}),
                ]),
              )),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primarycolor)),
                alignment: Alignment.center,
                width: 300,
                height: 60,
                child: Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Donor",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  Radio(
                      value: "Donor", groupValue: option3, onChanged: (val) {}),
                ]),
              )),
              const SizedBox(
                height: 50,
              ),
              CustomButton(title: "Continue")
            ]),
          )),
    );
  }
}
