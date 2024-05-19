// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomField extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);
  final IconData? suffex;
  final String? text;
  final String? hiinttext;
  final Function(String) onChanged;
  final String? value;
  IconData? prefex;

  // ignore: prefer_const_constructors_in_immutables
  CustomField(
      {required this.text,
      Key? key,
      required this.hiinttext,
      required this.onChanged,
      this.prefex,
      this.suffex,
      this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$text",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.grey[800]),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          cursorColor: primarycolor,
          // obscureText: true,
          decoration: InputDecoration(
            suffixIcon: Icon(
              suffex,
              color: Colors.grey,
            ),
            prefixIcon: Icon(
              prefex,
              color: primarycolor,
            ),
            hintText: hiinttext,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
          ),
          onChanged: (val) => onChanged(val),
          initialValue: value,
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
