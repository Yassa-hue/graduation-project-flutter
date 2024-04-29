import 'package:flutter/material.dart';
import 'package:graduationproject/pages/home_page.dart';
import 'package:graduationproject/pages/profile_page.dart';
import 'package:graduationproject/pages/settings_page.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/constants.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  int currentPage = homePage;

  CustomBottomBar({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.white,
      onTap: (value) {
        print("#############################################");
        print("Current value: $value");
        print("#############################################");
        // var route = MaterialPageRoute(builder: (context) => const HomePage());
        switch (value) {
          case profilePage:
            var route =
                MaterialPageRoute(builder: (context) => const ProfilePage());
            Navigator.of(context).pushReplacement(route);
            break;
          // TODO:
          // case campainPage:
          //   route = MaterialPageRoute(builder: (context) => const ());
          //   break;
          // case donationPage:
          //   route = MaterialPageRoute(builder: (context) => const ());
          //   break;
          case settingsPage:
            var route =
                MaterialPageRoute(builder: (context) => const SettingPage());
            Navigator.of(context).pushReplacement(route);
            break;
        }

        // Navigator.of(context).pushReplacement(route);
      },
      currentIndex: currentPage, // Set the currentIndex to currentPage
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.person,
            size: 35,
            color: (currentPage == profilePage ? PRIMARY_COLOR : Colors.white),
          ),
          label: " ",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.campaign,
            size: 35,
            color: (currentPage == campainPage ? PRIMARY_COLOR : Colors.white),
          ),
          label: " ",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.home,
            size: 35,
            color: (currentPage == homePage ? PRIMARY_COLOR : Colors.white),
          ),
          label: " ",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.stars_rounded,
            size: 35,
            color: (currentPage == donationPage ? PRIMARY_COLOR : Colors.white),
          ),
          label: " ",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.settings,
            size: 35,
            color: (currentPage == settingsPage ? PRIMARY_COLOR : Colors.white),
          ),
          label: " ",
        ),
      ],
      backgroundColor: Colors.black,
    );
  }
}