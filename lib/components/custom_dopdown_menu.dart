import 'package:flutter/material.dart';
import 'package:graduationproject/utils/color_palette.dart';

class DropdownItemData {
  final IconData? icon;
  final String title;

  DropdownItemData({this.icon, required this.title});
}

class CustomDropdown extends StatelessWidget {
  final String title;
  final List<DropdownItemData> items;
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.title,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: title,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          ),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item.title,
              child: Row(
                children: [
                  if (item.icon != null) Icon(item.icon, color: PRIMARY_COLOR),
                  if (item.icon != null) SizedBox(width: 10),
                  Text(item.title),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
