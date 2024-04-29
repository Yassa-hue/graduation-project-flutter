import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomProfile extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);
  IconData? icon;
  String? text;
  IconData? icon2;

  CustomProfile(
      {super.key, required this.icon, required this.text, this.icon2});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 40,
      width: 350,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: primarycolor,
            size: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "$text",
            style: TextStyle(
                color: primarycolor, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 100,
          ),
          Icon(
            icon2,
            size: 25,
            color: primarycolor,
          )
        ],
      ),
    );
  }
}
