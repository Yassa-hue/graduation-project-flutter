// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String? title;
  static const primarycolor = Color(0xff644AE5);
  CustomButton({
    Key? key,
    required this.title,
    this.onTap
  }) : super(key: key);
final void Function() ?onTap;
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
        onPressed:onTap?? () {},
        child:
            Text('$title', style: const TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
