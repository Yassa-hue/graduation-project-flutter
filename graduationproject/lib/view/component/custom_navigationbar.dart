import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);
  final IconData? val;
  bool isselected;
  // ignore: prefer_const_constructors_in_immutables
  CustomBottomNavigationBar(
      {super.key, required this.val, required this.isselected});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            selectedItemColor: primarycolor,
            backgroundColor: Colors.black,
            onTap: (value) {},
            items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                val,
                color: isselected ? primarycolor : Colors.white,
                size: 35,
              ),
              label: " "),
        ]));
  }
}
