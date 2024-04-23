import 'package:flutter/material.dart';
import 'package:zapx/zapx.dart';
import 'model/routes.dart';
import 'view/auth/widgets/change_password.dart';
import 'view/auth/widgets/correct.dart';
import 'view/auth/widgets/create_account.dart';
import 'view/auth/widgets/forget_password.dart';
import 'view/auth/widgets/logo.dart';
import 'view/auth/widgets/welcome_back.dart';
import 'view/auth/widgets/otp_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return XMaterialApp(
      routes: routes,
      initialRoute: Routes.welcome_back,
    );
  }
}
