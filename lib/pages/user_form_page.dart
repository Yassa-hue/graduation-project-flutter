import 'package:flutter/material.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:graduationproject/pages/home_page.dart';
import 'package:graduationproject/pages/login_page.dart';
import 'package:graduationproject/pages/profile_page.dart';
import 'package:graduationproject/utils/AuthProvider.dart';

import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/utils/color_palette.dart';

import 'package:graduationproject/components/custom_button.dart';
import 'package:graduationproject/components/custom_field.dart';
import 'package:graduationproject/components/dismiss_keyboard_on_tap.dart';

class UserFormPage extends StatefulWidget {
  final UserModel? currentUser;

  const UserFormPage({Key? key, this.currentUser}) : super(key: key);

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  bool agreeToTermsAndConditions = false;
  bool loading = false, isInputDataComplete = false;
  String errorMsg = "";
  String username = "",
      email = "",
      password = "",
      confirmPassword = "",
      // TODO: Add a dropdown menu to choose the role
      userRole = "volunteer",
      // TODO: Add the profile image
      profileImageUrl =
          "https://firebasestorage.googleapis.com/v0/b/graduation-project-d349a.appspot.com/o/profile.png?alt=media&token=7dc844d4-1c03-4918-860b-56fd78b032c6";

  void checkInputDataIsComplete() {
    errorMsg = "";

    isInputDataComplete = username.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        agreeToTermsAndConditions &&
        userRole.isNotEmpty &&
        profileImageUrl.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    if (widget.currentUser != null) {
      setState(() {
        username = widget.currentUser!.name;
        email = widget.currentUser!.email;
        password = widget.currentUser!.password;
        confirmPassword = widget.currentUser!.password;
        userRole = widget.currentUser!.role.toString();
        profileImageUrl = widget.currentUser!.profileImageUrl;
      });
    }
  }

  Future<void> signup() async {
    final auth = AuthProvider.of(context)!;
    setState(() {
      loading = true;
      errorMsg = "";
    });

    try {
      if (password != confirmPassword) {
        throw "Passwords do not match";
      }

      if (widget.currentUser != null) {
        await auth.updateUser({
          "name": username,
          "email": email,
          "password": password,
        });

        final route =
            MaterialPageRoute(builder: (context) => const ProfilePage());
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(route);
      } else {
        await auth.signup({
          "name": username,
          "email": email,
          "password": password,
          "role": userRole,
          "profileImageUrl": profileImageUrl,
        });

        final route = MaterialPageRoute(builder: (context) => const HomePage());
        Navigator.of(context).pushReplacement(route);
      }
    } catch (e) {
      setState(() => errorMsg = e.toString());
    }
    setState(() => loading = false);
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  (widget.currentUser == null
                      ? 'Create account'
                      : 'Update account'),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: PRIMARY_COLOR),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomField(
                  text: "Create account",
                  hiinttext: "User name",
                  prefex: Icons.person,
                  value: username,
                  onChanged: (value) => {
                    setState(() {
                      username = value;
                      checkInputDataIsComplete();
                    })
                  },
                ),
                CustomField(
                  text: "Email",
                  hiinttext: "sample@mail.com",
                  prefex: Icons.email,
                  value: email,
                  onChanged: (value) => {
                    setState(() {
                      email = value;

                      checkInputDataIsComplete();
                    })
                  },
                ),
                CustomField(
                  text: "Password",
                  hiinttext: "Password",
                  prefex: Icons.lock_person,
                  suffex: Icons.visibility_off,
                  onChanged: (value) => {
                    setState(() {
                      password = value;

                      checkInputDataIsComplete();
                    })
                  },
                ),
                CustomField(
                  text: "Confirm Password",
                  hiinttext: "Confirm Password",
                  prefex: Icons.lock_person,
                  suffex: Icons.visibility_off,
                  onChanged: (value) => {
                    setState(() {
                      confirmPassword = value;

                      checkInputDataIsComplete();
                    })
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: agreeToTermsAndConditions,
                      onChanged: (val) {
                        setState(() {
                          agreeToTermsAndConditions = val!;

                          checkInputDataIsComplete();
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
                      "I agree to the ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'terms & conditions',
                      style: TextStyle(
                          color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  title: (widget.currentUser == null) ? "Sign in" : "Confirm",
                  onTap: () => signup(),
                  isLoading: loading,
                  disabled: !isInputDataComplete,
                ),
                errorMsg.isEmpty
                    ? const SizedBox()
                    : const SizedBox(
                        height: 15,
                      ),
                (errorMsg.isNotEmpty)
                    ? Text(
                        errorMsg,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 15,
                ),
                (widget.currentUser == null)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 16,
                                color: PRIMARY_COLOR,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
