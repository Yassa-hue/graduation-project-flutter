import 'package:flutter/material.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/custom_bottom_bar_configs.dart';

class CustomBottomBar extends StatefulWidget {
  final PageController pageController;
  final int currentPage;

  CustomBottomBar({
    Key? key,
    required this.currentPage,
    required this.pageController,
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
      onTap: (index) {
        widget.pageController.jumpToPage(index);
      },
      currentIndex: widget.currentPage,
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
