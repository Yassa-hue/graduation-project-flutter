import 'package:flutter/material.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/constants.dart';

// ignore: must_be_immutable
class CustomPayment extends StatefulWidget {
  String? text;
  String? img;
  PaymentMethod paymentMethod;
  PaymentMethod groupValue;
  ValueChanged<PaymentMethod?>? onChanged; // Added onChanged function as argument

  CustomPayment({
    super.key,
    required this.text,
    this.img,
    required this.paymentMethod,
    required this.groupValue,
    this.onChanged, // Added onChanged function as argument
  });

  @override
  State<CustomPayment> createState() => _CustomPaymentState();
}

class _CustomPaymentState extends State<CustomPayment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: ListTile(
        title: Text(
          "${widget.text}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Radio<PaymentMethod>(
          activeColor: PRIMARY_COLOR,
          value: widget.paymentMethod,
          groupValue: widget.groupValue,
          onChanged: widget.onChanged, // Added onChanged function as argument
        ),
        trailing: Image.asset(
          "${widget.img}",
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
