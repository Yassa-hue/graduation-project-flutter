import 'package:flutter/material.dart';
import 'package:graduationproject/components/custom_bottom_bar.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:graduationproject/utils/custom_bottom_bar_configs.dart';

class MainPage extends StatefulWidget {
  final int currentPage;

  MainPage({required this.currentPage});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  List<BarIconConfig> _configs = [];

  @override
  void initState() {
    super.initState();

    // Initialize the configurations based on the current user role
    UserRole? currentUserType = AuthProvider.of(context)!.currentUser?.role;
    switch (currentUserType) {
      case UserRole.volunteer:
        _configs = volunteerConfigs;
        break;
      case UserRole.donor:
        _configs = donorConfigs;
        break;
      case UserRole.organization:
        _configs = organizationConfigs;
        break;
      default:
        _configs = volunteerConfigs;
        break;
    }

    _currentPage = widget.currentPage;
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: _configs.map((config) => config.page).toList(),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentPage: _currentPage,
        pageController: _pageController,
      ),
    );
  }
}
