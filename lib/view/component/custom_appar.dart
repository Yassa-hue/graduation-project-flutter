import 'package:flutter/material.dart';

class CustomAppar extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          Icons.notifications_none,
          color: primarycolor,
          size: 35,
        ),
        Container(
          width: 11,
          height: 11,
          margin: EdgeInsets.fromLTRB(17, 7, 0, 0),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffc32c37),
              border: Border.all(color: Colors.white, width: 1)),
        ),
      ],
    );
  }
}
