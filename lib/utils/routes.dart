import 'package:flutter/material.dart';
import 'package:graduationproject/view/auth/widgets/feedback.dart';
import 'package:graduationproject/view/auth/widgets/home_vol.dart';
import 'package:graduationproject/view/auth/widgets/options.dart';
import 'package:graduationproject/view/auth/widgets/otp_password.dart';
import 'package:graduationproject/view/auth/widgets/profile_vol.dart';
import 'package:graduationproject/view/auth/widgets/setting.dart';
import 'package:graduationproject/view/auth/widgets/splash1.dart';
import 'package:graduationproject/view/auth/widgets/splash2.dart';
import 'package:graduationproject/view/auth/widgets/splash3.dart';
import 'package:graduationproject/view/auth/widgets/verification_code.dart';
import 'package:graduationproject/view/auth/widgets/vol_about.dart';
import 'package:graduationproject/view/auth/widgets/vol_categories.dart';
import '../view/auth/widgets/change_password.dart';
import '../view/auth/widgets/correct.dart';
import '../view/auth/widgets/forget_password.dart';
import '../view/auth/widgets/logo.dart';
import '../view/auth/widgets/welcome_back.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Routes.welcome_back: (v) => WelcomeBack(),
  Routes.forget_password: (v) => const ForgetPassword(),
  Routes.logo: (v) => const Logo(),
  Routes.correct: (v) => const Correct(),
  Routes.change_password: (v) => const ChangePassword(),
  Routes.otp_password: (v) => const OtpPassword(),
  Routes.verification_code: (v) => const Code(),
  Routes.splash3: (v) => const Splash3(),
  Routes.splash1: (v) => const Splash1(),
  Routes.splash2: (v) => Splash2(),
  Routes.options: (v) => const Options(),
  Routes.vol_about: (v) => const AboutUs(),
  Routes.vol_categories: (v) => const Categories(),
  Routes.feedback: (v) => FeedBack(),
  Routes.setting: (v) => Setting(),
  Routes.home_vol: (v) => HomeVol(),
  Routes.profile_vol: (v) => ProfileVol(),
};

class Routes {
  static const String welcome_back = '/welcome_back';
  static const String forget_password = '/forget_password';
  static const String logo = '/logo';
  static const String correct = '/correct';
  static const String change_password = '/change_password';
  static const String otp_password = '/otp_password';
  static const String verification_code = '/verification_code';
  static const String splash3 = '/splash3';
  static const String splash1 = '/splash1';
  static const String splash2 = '/splash2';
  static const String options = '/options';
  static const String vol_about = '/vol_about';
  static const String vol_categories = '/vol_categories';
  static const String feedback = '/feedback';
  static const String setting = '/setting';
  static const String home_vol = '/home_vol';
  static const String profile_vol = '/profile_vol';
}
