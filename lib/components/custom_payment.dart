import 'package:flutter/material.dart';
import 'package:graduationproject/utils/color_palette.dart';

// ignore: must_be_immutable
class CustomPayment extends StatelessWidget {
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
        onTap: () => Border.all(color: PRIMARY_COLOR),
        title: Text(
          "$text",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Radio(
          activeColor: PRIMARY_COLOR,
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
