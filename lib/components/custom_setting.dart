import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSetting extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);
  Color? colr;
  String? text;
  final IconData? next;
  final VoidCallback? onClick; // Add onClick prop

  CustomSetting({super.key, required this.text, this.next, required this.colr, this.onClick});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
              const SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: onClick,
                  child: Text(
                "$text",
                style: TextStyle(
                    color: colr, fontWeight: FontWeight.bold, fontSize: 18),
                  )),
          ],
        ),
      ],
    );
  }
}
