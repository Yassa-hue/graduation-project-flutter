import 'package:flutter/material.dart';
import 'package:graduationproject/utils/color_palette.dart';

void showLanguageSettingOvelay(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Language'),
        content: Text("We only support English at the moment. Please check back later for more languages."),
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
