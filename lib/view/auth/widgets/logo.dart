import 'package:flutter/material.dart';
import '../../../model/model_pic.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});
  static const primarycolor = Color(0xff644AE5);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              color: primarycolor, borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
          child: Center(
              child: Image.asset(
            AssetModel.logo,
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}
