import 'package:flutter/material.dart';
import 'package:graduationproject/utils/color_palette.dart';

void showTermsAndConditions(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Terms & Conditions'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Text(
                '1. Acceptance of Terms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'By using Non-Profit Nexus, you agree to these terms and conditions.',
              ),
              SizedBox(height: 25),
              Text(
                '2. User Conduct',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'You agree to use the app responsibly and not engage in any disruptive or harmful behavior.',
              ),
              SizedBox(height: 25),
              Text(
                '3. Privacy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Your personal information is protected as per our privacy policy.',
              ),
              SizedBox(height: 25),
              Text(
                '4. Liability',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'We are not liable for any damages or losses resulting from your use of the app.',
              ),
              SizedBox(height: 25),
              Text(
                '5. Changes to Terms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'We may update these terms at any time. Continued use of the app implies acceptance of the updated terms.',
              ),
              SizedBox(height: 25),
              Text(
                '6. Contact',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'For questions, contact us at support@nonprofitnexus.com.',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Close',
              style: TextStyle(color: PRIMARY_COLOR),
            ),
          ),
        ],
      );
    },
  );
}
