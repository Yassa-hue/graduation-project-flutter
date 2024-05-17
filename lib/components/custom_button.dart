// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String? title;
  static const primarycolor = Color(0xff644AE5);
  CustomButton({
    Key? key,
    required this.title,
    this.onTap,
    this.disabled = false,
    this.isLoading = false, // Add isLoading option
  }) : super(key: key);
  final void Function()? onTap;
  final bool disabled;
  final bool isLoading; // Declare isLoading variable

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: disabled ? Colors.grey : primarycolor,
      ),
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        onPressed: disabled || isLoading ? null : onTap,
        child: isLoading
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(
                '$title',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
      ),
    );
  }
}
