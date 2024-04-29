import 'package:flutter/material.dart';
import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/components/custom_app_bar.dart';

import 'package:graduationproject/utils/color_palette.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                color: PRIMARY_COLOR,
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
              ),
              label: " "),
        ],
        backgroundColor: Colors.black,
      ),
      appBar: AppBar(backgroundColor: Colors.white70, elevation: 0.0, actions: [
        CustomAppBar(),
      ]),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(150)),
                        border: Border.all(color: Colors.grey)),
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        ImagesPaths.profile,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}