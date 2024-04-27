import 'package:flutter/material.dart';
import 'package:graduationproject/view/component/custom_appar.dart';
import 'package:graduationproject/view/component/custom_setting.dart';

class Setting extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);

  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        onTap: (value) {},
        items: const [
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
                Icons.campaign,
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
                Icons.stars_rounded,
                size: 35,
              ),
              label: " "),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.settings,
                size: 35,
                color: primarycolor,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Setting",
                style: TextStyle(
                    color: primarycolor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    const SizedBox(
                      height: 25,
                    ),
                    CustomSetting(
                      colr: primarycolor,
                      text: "Edit Profile         ",
                      next: Icons.navigate_next_sharp,
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    CustomSetting(
                      colr: primarycolor,
                      text: "Notification        ",
                      next: Icons.navigate_next_sharp,
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    CustomSetting(
                      colr: primarycolor,
                      text: "Security              ",
                      next: Icons.navigate_next_sharp,
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    CustomSetting(
                      colr: primarycolor,
                      text: "Language           ",
                      next: Icons.navigate_next_sharp,
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    CustomSetting(
                      colr: primarycolor,
                      text: "Feedback           ",
                      next: Icons.navigate_next_sharp,
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    CustomSetting(
                      colr: primarycolor,
                      text: "Support              ",
                      next: Icons.navigate_next_sharp,
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    CustomSetting(
                      colr: primarycolor,
                      text: "Privacy & Policy",
                      next: Icons.navigate_next_sharp,
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    CustomSetting(
                      colr: Colors.red,
                      text: "Logout     ",
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
