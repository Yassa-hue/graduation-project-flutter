import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String? text;
  String? img;
  CustomCard({super.key,  this.text, required this.img});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Column(children: [
        Container(
            padding: EdgeInsets.all(20),
            height: 130,
            width: 200,
            child: Image.asset(
              "$img",
              fit: BoxFit.cover,
            )),
        Text(
          "$text",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ]),
    );
  }
}
