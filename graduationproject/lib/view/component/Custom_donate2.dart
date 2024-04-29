import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDonateTow extends StatelessWidget {
  String? text;

  CustomDonateTow({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 96,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border:
              Border.all(color: Color.fromARGB(255, 225, 218, 218), width: 2)),
      child: TextButton(
          onPressed: () {},
          child: Text(
            "$text",
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          )),
    );
  }
}
