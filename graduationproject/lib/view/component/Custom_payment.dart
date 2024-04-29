import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomPayment extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);

  String? _paymentMethod;
  String? text;
  String? img;

  CustomPayment({super.key, required this.text, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey)),
      child: ListTile(
        onTap: () => Border.all(color: primarycolor),
        title: Text(
          "$text",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Radio(
          activeColor: primarycolor,
          value: '$text',
          groupValue: _paymentMethod,
          onChanged: (String? value) {},
        ),
        trailing: Image.asset(
          "$img",
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
