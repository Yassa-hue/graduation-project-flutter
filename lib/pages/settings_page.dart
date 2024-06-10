import 'package:flutter/material.dart';

import 'package:graduationproject/components/custom_setting.dart';
import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/components/notification_setting.dart';
import 'package:graduationproject/pages/language_setting_overlay.dart';
import 'package:graduationproject/pages/login_page.dart';
import 'package:graduationproject/pages/notification_page.dart';
import 'package:graduationproject/pages/privacy_policy_page.dart';
import 'package:graduationproject/pages/user_form_page.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/utils/color_palette.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Future<void> logout() async {
    final auth = AuthProvider.of(context)!;

    await auth.logout();

    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: Colors.white70,
          elevation: 0.0,
          actions: const [
            CustomAppBar(),
          ]),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                      colr: PRIMARY_COLOR,
                      text: "Edit Profile",
                      next: Icons.navigate_next_sharp,
                      onClick: () {
                        final route = MaterialPageRoute(
                            builder: (context) => UserFormPage(
                                  currentUser:
                                      AuthProvider.of(context)!.currentUser,
                                ));

                        // ignore: use_build_context_synchronously
                        Navigator.of(context).push(route);
                      },
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    NotificationSetting(
                      text: "Notifications",
                      initialValue: true,
                      onChanged: (bool value) {
                        // Handle notification toggle logic here
                        print("Notifications: $value");
                      },
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => NotificationPage()),
                        );
                      },
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    CustomSetting(
                      colr: PRIMARY_COLOR,
                      text: "Language",
                      next: Icons.navigate_next_sharp,
                      onClick: () {
                        showLanguageSettingOvelay(context);
                      },
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    CustomSetting(
                      colr: PRIMARY_COLOR,
                      text: "Support",
                      next: Icons.navigate_next_sharp,
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    CustomSetting(
                      colr: PRIMARY_COLOR,
                      text: "Privacy Policy",
                      next: Icons.navigate_next_sharp,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => PrivacyPolicyPage()),
                        );
                      },
                    ),
                    const Divider(
                      endIndent: 15,
                      indent: 15,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    CustomSetting(
                      colr: Colors.red,
                      text: "Logout",
                      onClick: logout,
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
