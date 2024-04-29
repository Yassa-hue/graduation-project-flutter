import 'package:flutter/material.dart';
import 'package:graduationproject/view/component/Custom_donate2.dart';
import 'package:graduationproject/view/component/custom_appar.dart';
import 'package:graduationproject/view/component/custom_button.dart';
import 'package:graduationproject/view/component/custom_donate.dart';

class DonateNow extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        onTap: (value) {},
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              label: " "),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.handshake,
                size: 35,
              ),
              label: " "),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: " "),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.money_sharp,
                color: primarycolor,
                size: 35,
              ),
              label: " "),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.settings,
                size: 35,
              ),
              label: " "),
        ],
        backgroundColor: Colors.black,
      ),
      appBar: AppBar(backgroundColor: Colors.white70, elevation: 0.0, actions: [
        CustomAppar(),
      ]),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: const Text(
                  "Donate Now ",
                  style: TextStyle(
                      color: primarycolor,
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
                  SizedBox(
                    width: 10,
                  ),
                  CustomDonate(text: "30"),
                  SizedBox(
                    width: 10,
                  ),
                  CustomDonate(text: "50"),
                  SizedBox(
                    width: 10,
                  ),
                  CustomDonate(text: "100"),
                  SizedBox(
                    width: 10,
                  ),
                  CustomDonate(text: "200"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Enter another amount ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                    height: 60,
                    width: 260,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: Color.fromARGB(255, 225, 218, 218),
                            width: 2)),
                    child: TextField(
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
              SizedBox(
                height: 60,
              ),
              Text(
                "Is this donation periodic ? ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Choose how you want this donation to be       deducted from your wallet."),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Row(
                  children: [
                    CustomDonateTow(text: "Weakly"),
                    SizedBox(
                      width: 10,
                    ),
                    CustomDonateTow(text: "Monthly"),
                    SizedBox(
                      width: 10,
                    ),
                    CustomDonateTow(text: "Annually"),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(title: "Confirm"),
              SizedBox(
                height: 50,
              )
            ]),
          )),
    );
  }
}
