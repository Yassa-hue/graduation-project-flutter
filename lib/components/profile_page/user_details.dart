import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final String name;
  final String email;

  const UserDetails({required this.name, required this.email, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(email, style: const TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }
}
