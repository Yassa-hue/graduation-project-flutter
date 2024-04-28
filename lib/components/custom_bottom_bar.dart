import 'package:flutter/material.dart';
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
      onTap: (value) {},
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
