import 'package:flutter/material.dart';

import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/components/custom_bottom_bar.dart';
import 'package:graduationproject/components/custom_button.dart';
import 'package:graduationproject/components/custom_donate.dart';
import 'package:graduationproject/components/custom_donate_tow.dart';

import 'package:graduationproject/utils/constants.dart';
import 'package:graduationproject/utils/color_palette.dart';

class MakeDonationPage extends StatefulWidget {
  const MakeDonationPage({super.key});

  @override
  State<MakeDonationPage> createState() => _MakeDonationPageState();
}

class _MakeDonationPageState extends State<MakeDonationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(currentPage: donationPage),
      appBar: AppBar(backgroundColor: Colors.white70, elevation: 0.0, actions: const [
        CustomAppBar(),
      ]),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Center(
                child: Text(
                  "Donate Now ",
                  style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  CustomDonate(text: "10"),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomDonate(text: "30"),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomDonate(text: "50"),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomDonate(text: "100"),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomDonate(text: "200"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  "Enter another amount ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                    height: 60,
                    width: 260,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: const Color.fromARGB(255, 225, 218, 218),
                            width: 2)),
                    child: const TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixText: "  \$",
                          prefixStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black),
                          border: InputBorder.none),
                    )),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Is this donation periodic ? ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "Choose how you want this donation to be       deducted from your wallet."),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Row(
                  children: [
                    CustomDonateTow(text: "Weakly"),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomDonateTow(text: "Monthly"),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomDonateTow(text: "Annually"),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(title: "Confirm"),
              const SizedBox(
                height: 50,
              )
            ]),
          )),
    );
  }
}
