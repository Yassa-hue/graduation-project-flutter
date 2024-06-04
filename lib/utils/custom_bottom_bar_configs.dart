import 'package:flutter/material.dart';
import 'package:graduationproject/pages/apply_for_volunteering_page.dart';
import 'package:graduationproject/pages/dashboard_page.dart';
import 'package:graduationproject/pages/donation_categories.dart';
import 'package:graduationproject/pages/home_page.dart';
import 'package:graduationproject/pages/make_donation_page.dart';
import 'package:graduationproject/pages/campaign_form_page.dart';
import 'package:graduationproject/pages/profile_page.dart';
import 'package:graduationproject/pages/settings_page.dart';
import 'package:graduationproject/pages/volunteering_categories_page.dart';

class BarIconConfig {
  final String name;
  final IconData icon;
  final Widget page;

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
    page: ProfilePage(),
  ),
  BarIconConfig(
    name: "Volunteering Categories",
    icon: Icons.campaign,
    page: VolunteeringCategoriesPage(),
  ),
  BarIconConfig(
    name: "Home",
    icon: Icons.home,
    page: HomePage(),
  ),
  BarIconConfig(
    name: "Apply for Volunteering",
    icon: Icons.stars_rounded,
    page: ApplyForVolunteeringPage(),
  ),
  BarIconConfig(
    name: "Settings",
    icon: Icons.settings,
    page: SettingPage(),
  ),
];

var donorConfigs = [
  BarIconConfig(
    name: "Profile",
    icon: Icons.person,
    page: ProfilePage(),
  ),
  BarIconConfig(
    name: "Donation Categories",
    icon: Icons.campaign,
    page: DonationCategories(),
  ),
  BarIconConfig(
    name: "Home",
    icon: Icons.home,
    page: HomePage(),
  ),
  BarIconConfig(
    name: "Make Donation",
    icon: Icons.money_rounded,
    page: MakeDonationPage(),
  ),
  BarIconConfig(
    name: "Settings",
    icon: Icons.settings,
    page: SettingPage(),
  ),
];

var organizationConfigs = [
  BarIconConfig(
    name: "Profile",
    icon: Icons.person,
    page: ProfilePage(),
  ),
  BarIconConfig(
    name: "New Campaign",
    icon: Icons.add,
    page: CampaignFormPage(),
  ),
  BarIconConfig(
    name: "Home",
    icon: Icons.home,
    page: HomePage(),
  ),
  BarIconConfig(
    name: "Dashboard",
    icon: Icons.stars_rounded,
    page: DashboardPage(),
  ),
  BarIconConfig(
    name: "Settings",
    icon: Icons.settings,
    page: SettingPage(),
  ),
];
