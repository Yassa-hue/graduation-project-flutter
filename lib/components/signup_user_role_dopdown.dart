import 'package:flutter/material.dart';
import 'package:graduationproject/utils/color_palette.dart';

class CustomDropdown extends StatelessWidget {
  final String selectedRole;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.selectedRole,
    required this.onChanged,
  }) : super(key: key);

  IconData getIcon(String role) {
    switch (role) {
      case 'donor':
        return Icons.favorite;
      case 'volunteer':
        return Icons.volunteer_activism;
      case 'organization':
        return Icons.business;
      default:
        return Icons.person;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        DropdownButtonFormField<String>(
          value: selectedRole,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: 'Select User Role',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          ),
          items: const [
            DropdownMenuItem(
              value: 'donor',
              child: Row(
                children: [
                  Icon(Icons.favorite, color: PRIMARY_COLOR),
                  SizedBox(width: 10),
                  Text('Donor'),
                ],
              ),
            ),
            DropdownMenuItem(
              value: 'volunteer',
              child: Row(
                children: [
                  Icon(Icons.volunteer_activism, color: PRIMARY_COLOR),
                  SizedBox(width: 10),
                  Text('Volunteer'),
                ],
              ),
            ),
            DropdownMenuItem(
              value: 'organization',
              child: Row(
                children: [
                  Icon(Icons.business, color: PRIMARY_COLOR),
                  SizedBox(width: 10),
                  Text('Organization'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
