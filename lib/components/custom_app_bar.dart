import 'package:flutter/material.dart';
import 'package:graduationproject/pages/notification_page.dart';
import 'package:graduationproject/utils/color_palette.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const NotificationPage()));
      },
      child: Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(
            Icons.notifications_none,
            color: PRIMARY_COLOR,
            size: 35,
        ),
        Container(
            width: 11,
            height: 11,
            margin: const EdgeInsets.fromLTRB(17, 7, 0, 0),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffc32c37),
                border: Border.all(color: Colors.white, width: 1)),
        ),
      ],
      ),
    );
  }
}
