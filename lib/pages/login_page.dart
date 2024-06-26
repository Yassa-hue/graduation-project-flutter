import 'package:flutter/material.dart';
import 'package:graduationproject/pages/page_manager.dart';
import 'package:graduationproject/pages/user_form_page.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/pages/reset_password_page.dart';
import 'package:graduationproject/components/dismiss_keyboard_on_tap.dart';
import 'package:graduationproject/utils/constants.dart';
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
  bool loading = false, isInputDataComplete = false;
  String errorMsg = "";

  @override
  void initState() {
    super.initState();
    final auth = AuthProvider.of(context)!;
    if (auth.currentUser != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(
              currentPage: homePage,
            ),
          ),
        );
      });
    }
  }

  Future<void> login() async {
    setState(() => loading = true);
    final auth = AuthProvider.of(context)!;

    try {
      await auth.login(email, password);

      final route = MaterialPageRoute(
          builder: (context) => MainPage(
                currentPage: homePage,
              ));
      Navigator.of(context).pushReplacement(route);
    } catch (e) {
      setState(() => errorMsg = e.toString());
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                hintText: "sample@mail.com",
                prefex: Icons.email,
                onChanged: (value) => {
                  setState(() {
                    errorMsg = "";
                    email = value;

                    isInputDataComplete =
                        email.isNotEmpty && password.isNotEmpty;
                  })
                },
              ),
              CustomField(
                text: "Password",
                hintText: "********",
                prefex: Icons.lock_person,
                typePassword: true,
                onChanged: (value) => {
                  setState(() {
                    errorMsg = "";
                    password = value;

                    isInputDataComplete =
                        email.isNotEmpty && password.isNotEmpty;
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
                disabled: !isInputDataComplete,
                isLoading: loading,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                errorMsg,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserFormPage()),
                      );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16,
                        color: PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
