import 'package:flutter/material.dart';
import 'package:graduationproject/utils/color_palette.dart';

// ignore: must_be_immutable
class CustomField extends StatefulWidget {
  final String? text;
  final String? hintText;
  final Function(String) onChanged;
  final String? value;
  final IconData? prefex;
  final bool typePassword;

  CustomField({
    required this.text,
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.prefex,
    this.value,
    this.typePassword = false,
  }) : super(key: key);

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.text}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          cursorColor: PRIMARY_COLOR,
          obscureText: widget.typePassword ? _obscureText : false,
          decoration: InputDecoration(
            suffixIcon: widget.typePassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      (_obscureText ? Icons.visibility : Icons.visibility_off),
                      color: Colors.grey,
                    ),
                  )
                : null,
            prefixIcon: Icon(
              widget.prefex,
              color: PRIMARY_COLOR,
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onChanged: (val) => widget.onChanged(val),
          initialValue: widget.value,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
