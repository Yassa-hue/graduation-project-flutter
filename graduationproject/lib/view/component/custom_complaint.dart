import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomComplaints extends StatelessWidget {
  String? title;

  CustomComplaints({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.grey)),
      child: TextButton(
          onPressed: () {},
          child: Text("$title",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.grey[800]))),
    );
  }
}
