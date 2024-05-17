import 'package:flutter/material.dart';
import 'package:graduationproject/components/custom_bottom_bar.dart';
import 'package:graduationproject/pages/login_page.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/utils/constants.dart';
import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:graduationproject/utils/AuthProvider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel? currentUser;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentUser = AuthProvider.of(context)!.currentUser;
    });
  }

  Future<void> logout () async {
    final auth = AuthProvider.of(context)!;

    await auth.logout();

    // ignore: use_build_context_synchronously
    Navigator.push(context,
                   MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(currentPage: profilePage),
      appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0.0,
          actions: const [
            CustomAppBar(),
          ]),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(150)),
                      border: Border.all(color: Colors.grey)),
                  height: 150,
                  width: 150,
                  child: currentUser != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: Image.network(
                            currentUser!.profileImageUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () => logout(),
                  child: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
