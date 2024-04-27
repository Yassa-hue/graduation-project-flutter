import 'package:flutter/material.dart';
import 'package:zapx/zapx.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graduationproject/utils/AuthProvider.dart';

import 'model/routes.dart';

import 'view/auth/widgets/change_password.dart';
import 'view/auth/widgets/correct.dart';
import 'view/auth/widgets/create_account.dart';
import 'view/auth/widgets/forget_password.dart';
import 'view/auth/widgets/logo.dart';
import 'view/auth/widgets/welcome_back.dart';
import 'view/auth/widgets/otp_password.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(AuthProvider(child: const MyApp()));
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
