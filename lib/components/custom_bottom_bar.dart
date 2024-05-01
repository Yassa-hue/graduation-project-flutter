import 'package:flutter/material.dart';
import 'package:graduationproject/models/user_model.dart';
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

class BarIconConfig {
  final String name;
  final IconData icon;
  final Function page;

  BarIconConfig({
    required this.name,
    required this.icon,
    required this.page,
  });
}

var volunteerConfigs = [
  BarIconConfig(
    name: "Profile",
    icon: Icons.person,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ProfilePage())),
  ),
  BarIconConfig(
    name: "Volunteering Categories",
    icon: Icons.campaign,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const VolunteeringCategoriesPage())),
  ),
  BarIconConfig(
    name: "Home",
    icon: Icons.home,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage())),
  ),
  BarIconConfig(
    name: "Apply for Volunteering",
    icon: Icons.stars_rounded,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const ApplyForVolunteeringPage())),
  ),
  BarIconConfig(
    name: "Settings",
    icon: Icons.settings,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SettingPage())),
  ),
];

var donorConfigs = [
  BarIconConfig(
    name: "Profile",
    icon: Icons.person,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ProfilePage())),
  ),
  BarIconConfig(
    name: "Donation Categories",
    icon: Icons.campaign,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DonationCategories())),
  ),
  BarIconConfig(
    name: "Home",
    icon: Icons.home,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage())),
  ),
  BarIconConfig(
    name: "Make Donation",
    icon: Icons.money_rounded,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MakeDonationPage())),
  ),
  BarIconConfig(
    name: "Settings",
    icon: Icons.settings,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SettingPage())),
  ),
];

var organizationConfigs = [
  BarIconConfig(
    name: "Profile",
    icon: Icons.person,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ProfilePage())),
  ),
  BarIconConfig(
    name: "New Campaign",
    icon: Icons.campaign,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NewCampaign())),
  ),
  BarIconConfig(
    name: "Home",
    icon: Icons.home,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage())),
  ),
  BarIconConfig(
    name: "Dashboard",
    icon: Icons.stars_rounded,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashboardPage())),
  ),
  BarIconConfig(
    name: "Settings",
    icon: Icons.settings,
    page: (BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SettingPage())),
  ),
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
  List<BarIconConfig> configs = volunteerConfigs;

  @override
  void initState() {
    super.initState();

    UserRole? currentUserType = AuthProvider.of(context)!.currentUser?.role;
    switch (currentUserType) {
      case UserRole.volunteer:
        configs = volunteerConfigs;
        break;
      case UserRole.donor:
        configs = donorConfigs;
        break;
      case UserRole.organization:
        configs = organizationConfigs;
        break;
      default:
        configs = volunteerConfigs;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.white,
      onTap: (value) {
        configs[value].page(context);
      },
      currentIndex: widget.currentPage, // Set the currentIndex to currentPage
      items: List.generate(
        configs.length,
        (index) => BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            configs[index].icon,
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
