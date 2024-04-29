import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDonate extends StatelessWidget {
  String? text;

  CustomDonate({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border:
              Border.all(color: Color.fromARGB(255, 225, 218, 218), width: 2)),
      child: TextButton(
          onPressed: () {},
          child: Text(
            "$text",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
