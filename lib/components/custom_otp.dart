import 'package:flutter/material.dart';

class OTP extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);

  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: TextField(
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 231, 234, 236),
              ),
              borderRadius: BorderRadius.circular(11)),
        ),
        cursorColor: primarycolor,
      ),
    );
  }
}
