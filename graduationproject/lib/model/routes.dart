import 'package:flutter/material.dart';
import 'package:graduationproject/view/auth/widgets/aboutus_don.dart';
import 'package:graduationproject/view/auth/widgets/add_event_admin.dart';
import 'package:graduationproject/view/auth/widgets/admin_profile.dart';
import 'package:graduationproject/view/auth/widgets/dashboard.dart';
import 'package:graduationproject/view/auth/widgets/donate_now_don.dart';
import 'package:graduationproject/view/auth/widgets/donation_categories.dart';
import 'package:graduationproject/view/auth/widgets/feedback_don.dart';
import 'package:graduationproject/view/auth/widgets/feedback_vol.dart';
import 'package:graduationproject/view/auth/widgets/home_admin.dart';
import 'package:graduationproject/view/auth/widgets/home_don.dart';
import 'package:graduationproject/view/auth/widgets/home_vol.dart';
import 'package:graduationproject/view/auth/widgets/loading.dart';
import 'package:graduationproject/view/auth/widgets/options.dart';
import 'package:graduationproject/view/auth/widgets/otp_password.dart';
import 'package:graduationproject/view/auth/widgets/payment_method.dart';
import 'package:graduationproject/view/auth/widgets/profile_don.dart';
import 'package:graduationproject/view/auth/widgets/profile_vol.dart';
import 'package:graduationproject/view/auth/widgets/setting.dart';
import 'package:graduationproject/view/auth/widgets/setting_admin.dart';
import 'package:graduationproject/view/auth/widgets/setting_don.dart';
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
  Routes.feedback_vol: (v) => FeedBackVol(),
  Routes.setting: (v) => Setting(),
  Routes.home_vol: (v) => HomeVol(),
  Routes.profile_vol: (v) => ProfileVol(),
  Routes.admin_profile: (v) => AdminProfile(),
  Routes.dashboard: (v) => DashBoard(),
  Routes.setting_admin: (v) => SettingAdmin(),
  Routes.home_admin: (v) => HomeAdmin(),
  Routes.add_event_admin: (v) => AddEvent(),
  Routes.setting_don: (v) => SettingDonor(),
  Routes.feedback_don: (v) => FeedbackDon(),
  Routes.aboutus_don: (v) => AboutUsDon(),
  Routes.donation_categories: (v) => DonationCategories(),
  Routes.home_don: (v) => HomeDon(),
  Routes.profile_don: (v) => ProfileDonor(),
  Routes.donate_now: (v) => DonateNow(),
  Routes.payment_method: (v) => PaymentMethod(),
  Routes.loading: (v) => Loading(),
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
  static const String feedback_vol = '/feedback_vol';
  static const String setting = '/setting';
  static const String home_vol = '/home_vol';
  static const String profile_vol = '/profile_vol';
  static const String admin_profile = '/admin_profile';
  static const String dashboard = '/dashboard';
  static const String setting_admin = '/setting_admin';
  static const String home_admin = '/home_admin';
  static const String add_event_admin = '/add_event_admin';
  static const String setting_don = '/setting_don';
  static const String feedback_don = '/feedback_don';
  static const String aboutus_don = '/aboutus_don';
  static const String donation_categories = '/donation_categories';
  static const String home_don = '/home_don';
  static const String profile_don = '/profile_don';
  static const String donate_now = '/donate_now_don';
  static const String payment_method = '/payment_method';
  static const String loading = '/loading';
}
