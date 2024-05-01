import 'package:flutter/material.dart';
import 'package:graduationproject/pages/apply_for_volunteering_page.dart';

import 'package:graduationproject/pages/dashboard_page.dart';
import 'package:graduationproject/pages/donation_categories.dart';
import 'package:graduationproject/pages/home_page.dart';
import 'package:graduationproject/pages/make_donation_page.dart';
import 'package:graduationproject/pages/new_campaign.dart';
import 'package:graduationproject/pages/profile_page.dart';
import 'package:graduationproject/pages/settings_page.dart';
import 'package:graduationproject/pages/volunteering_categories_page.dart';
import 'package:graduationproject/utils/AuthProvider.dart';

import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/constants.dart';

var volunteerConfigs = [
  {
    "name": "Profile",
    "icon": Icons.person,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ProfilePage())),
  },
  {
    "name": "Volunteering Categories",
    "icon": Icons.campaign,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const VolunteeringCategoriesPage())),
  },
  {
    "name": "Home",
    "icon": Icons.home,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage())),
  },
  {
    "name": "Apply for Volunteering",
    "icon": Icons.stars_rounded,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const ApplyForVolunteeringPage())),
  },
  {
    "name": "Settings",
    "icon": Icons.settings,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SettingPage())),
  },
];

var donorConfigs = [
  {
    "name": "Profile",
    "icon": Icons.person,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ProfilePage())),
  },
  {
    "name": "Donation Categories",
    "icon": Icons.campaign,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DonationCategories())),
  },
  {
    "name": "Home",
    "icon": Icons.home,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage())),
  },
  {
    "name": "Make Donation",
    "icon": Icons.money_rounded,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MakeDonationPage())),
  },
  {
    "name": "Settings",
    "icon": Icons.settings,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SettingPage())),
  },
];

var organizationConfigs = [
  {
    "name": "Profile",
    "icon": Icons.person,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ProfilePage())),
  },
  {
    "name": "New Campaign",
    "icon": Icons.campaign,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NewCampaign())),
  },
  {
    "name": "Home",
    "icon": Icons.home,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage())),
  },
  {
    "name": "Dashboard",
    "icon": Icons.stars_rounded,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashboardPage())),
  },
  {
    "name": "Settings",
    "icon": Icons.settings,
    "page": (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SettingPage())),
  },
];

// ignore: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  int currentPage = homePage;

  CustomBottomBar({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  List<Map<String, Object>> configs = volunteerConfigs;

  @override
  void initState() {
    super.initState();

    String? currentUserType = AuthProvider.of(context)!.currentUser?.role;
    switch (currentUserType) {
      case "volunteer":
        configs = volunteerConfigs;
        break;
      case "donor":
        configs = donorConfigs;
        break;
      case "organization":
        configs = organizationConfigs;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.white,
      onTap: (value) {
        (configs[value]["page"] as Function)(context);
      },
      currentIndex: widget.currentPage, // Set the currentIndex to currentPage
      items: List.generate(
        configs.length,
        (index) => BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            (configs[index]["icon"] as IconData),
            size: 35,
            color: (widget.currentPage == index ? PRIMARY_COLOR : Colors.white),
          ),
          label: " ",
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
