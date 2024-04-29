// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String? title;
  static const primarycolor = Color(0xff644AE5);
  CustomButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: primarycolor,
      ),
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        onPressed: () {},
        child:
            Text('$title', style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
