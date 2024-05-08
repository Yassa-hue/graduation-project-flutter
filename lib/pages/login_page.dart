import 'package:flutter/material.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/pages/home_page.dart';
import 'package:graduationproject/pages/reset_password_page.dart';
import 'package:graduationproject/components/dismiss_keyboard_on_tap.dart';
import '../../../utils/images_paths.dart';
import '../components/custom_button.dart';
import '../components/custom_field.dart';
import '../utils/color_palette.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  String email = "";
  String password = "";
  // TODO: https://github.com/Yassa-hue/graduation-project-flutter/issues/4
  bool loading = false;
  String error = "";

  Future<void> login() async {
    final auth = AuthProvider.of(context)!;

    try {
      await auth.login(email, password);

      final route = MaterialPageRoute(builder: (context) => const HomePage());
      Navigator.of(context).pushReplacement(route);
    } catch (e) {
      // TODO: https://github.com/Yassa-hue/graduation-project-flutter/issues/5
      print("########################################");
      print(e);
      print("########################################");
      setState(() => error = e.toString());
    }
    setState(() => loading = false);
  }

  void navigateToResetPasswordPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ResetPasswordPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DismissKeyboardOnTap(
      child: Container(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                  child: Container(
                padding: const EdgeInsets.only(top: 40),
                height: 250,
                child: Image.asset(
                  ImagesPaths.undraw,
                  width: 210,
                  fit: BoxFit.cover,
                ),
              )),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Welcome Back',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: PRIMARY_COLOR),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                text: "Email",
                hiinttext: "ys198@mail.com",
                prefex: Icons.email,
                onChanged: (value) => {
                  setState(() {
                    email = value;
                  })
                },
              ),
              CustomField(
                text: "Password",
                hiinttext: "********",
                prefex: Icons.lock_person,
                suffex: Icons.visibility_off,
                onChanged: (value) => {
                  setState(() {
                    password = value;
                  })
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (val) {
                      setState(() {
                        rememberMe = val!;
                      });
                    },
                    side: const BorderSide(
                        color: PRIMARY_COLOR,
                        style: BorderStyle.solid,
                        width: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 17),
                  ),
                  const SizedBox(),
                  TextButton(
                    onPressed: () => navigateToResetPasswordPage(),
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: PRIMARY_COLOR,
                          fontSize: 17),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onTap: () => login(),
                title: "Login",
              )
            ]),
          )),
    ));
  }
}
