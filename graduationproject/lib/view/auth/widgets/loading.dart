import 'package:flutter/material.dart';
import 'package:graduationproject/model/model_pic.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AssetModel.loading,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 600,
            ),
          ),
        ],
      ),
    );
  }
}
