import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduationproject/components/custom_image_picker.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:graduationproject/pages/login_page.dart';
import 'package:graduationproject/pages/page_manager.dart';
import 'package:graduationproject/pages/profile_page.dart';
import 'package:graduationproject/utils/AuthProvider.dart';

import 'package:graduationproject/utils/color_palette.dart';

import 'package:graduationproject/components/custom_button.dart';
import 'package:graduationproject/components/custom_field.dart';
import 'package:graduationproject/components/dismiss_keyboard_on_tap.dart';
import 'package:graduationproject/components/custom_dopdown_menu.dart';

List<DropdownItemData> dropdownItemsData = [
  DropdownItemData(icon: Icons.favorite, title: 'donor'),
  DropdownItemData(icon: Icons.volunteer_activism, title: 'volunteer'),
  DropdownItemData(icon: Icons.business, title: 'organization'),
];

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
      userRole = "donor";
  String? profileImageUrl;

  File? profileImage;

  void checkInputDataIsComplete() {
    errorMsg = "";

    isInputDataComplete = username.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        agreeToTermsAndConditions &&
        userRole.isNotEmpty &&
        (profileImage != null || profileImageUrl != null);
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
    setState(() {
      loading = true;
      errorMsg = "";
    });

    final auth = AuthProvider.of(context)!;

    profileImageUrl = await auth.uploadImage(profileImage!);

    try {
      if (password != confirmPassword) {
        throw "Passwords do not match";
      }

      if (widget.currentUser != null) {
        await auth.updateUser({
          "name": username,
          "email": email,
          "password": password,
          "profileImageUrl": profileImageUrl,
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

        final route = MaterialPageRoute(builder: (context) => MainPage());
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
                SafeArea(child: Container()),
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
                const SizedBox(height: 20),
                CustomImagePicker(
                  defaultImageLink: profileImageUrl,
                  onImageIsSelected: (imageFile) {
                    setState(() {
                      profileImage = imageFile;

                      checkInputDataIsComplete();
                    });
                  },
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Pick a profile photo',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomField(
                  text: "User name",
                  hintText: "User name",
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
                  hintText: "sample@mail.com",
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
                  hintText: "Password",
                  prefex: Icons.lock_person,
                  typePassword: true,
                  onChanged: (value) => {
                    setState(() {
                      password = value;

                      checkInputDataIsComplete();
                    })
                  },
                ),
                CustomField(
                  text: "Confirm Password",
                  hintText: "Confirm Password",
                  typePassword: true,
                  prefex: Icons.lock_person,
                  onChanged: (value) => {
                    setState(() {
                      confirmPassword = value;

                      checkInputDataIsComplete();
                    })
                  },
                ),
                if (widget.currentUser == null)
                  CustomDropdown(
                    title: "User Role",
                    items: dropdownItemsData,
                    selectedValue: userRole,
                    onChanged: (String? newValue) {
                      setState(() {
                        userRole = newValue!;
                        checkInputDataIsComplete();
                      });
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
                  title: (widget.currentUser == null) ? "Sign up" : "Confirm",
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
