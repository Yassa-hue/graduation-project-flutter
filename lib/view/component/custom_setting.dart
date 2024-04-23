import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSetting extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);
  Color? colr;
  String? text;
  final IconData? next;

  CustomSetting({super.key, required this.text, this.next, required this.colr});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "$text",
                  style: TextStyle(
                      color: colr, fontWeight: FontWeight.bold, fontSize: 18),
                )),
            const SizedBox(
              width: 120,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  next,
                  color: primarycolor,
                  size: 35,
                ))
          ],
        ),
      ],
    );
  }
}
