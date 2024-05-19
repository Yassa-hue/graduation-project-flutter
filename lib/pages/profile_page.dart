import 'package:flutter/material.dart';
import 'package:graduationproject/components/custom_bottom_bar.dart';
import 'package:graduationproject/pages/login_page.dart';
import 'package:graduationproject/components/profile_page/activity_list.dart';
import 'package:graduationproject/components/profile_page/user_details.dart';
import 'package:graduationproject/models/campaign_model.dart';
import 'package:graduationproject/models/donation_model.dart';
import 'package:graduationproject/models/volunteering_activity_model.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/utils/constants.dart';
import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel? currentUser;
  List<dynamic> activities = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      currentUser = AuthProvider.of(context)!.currentUser;
      activities = _getActivitiesForUser(currentUser);
    });
  }

  Future<void> logout () async {
    final auth = AuthProvider.of(context)!;

    await auth.logout();

    // ignore: use_build_context_synchronously
    Navigator.push(context,
                   MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  List<dynamic> _getActivitiesForUser(UserModel? user) {
    // Sample data for demonstration purposes
    if (user == null) return [];

    switch (user.role) {
      case UserRole.donor:
        return [
          Donation(
              donorId: user.id,
              amount: 100.0,
              receivingOrganizationId: "org1",
              periodicity: Periodicity.monthly,
              createdAt: DateTime.now()),
          Donation(
              donorId: user.id,
              amount: 200.0,
              receivingOrganizationId: "org2",
              periodicity: Periodicity.weekly,
              createdAt: DateTime.now()),
        ];
      case UserRole.volunteer:
        return [
          VolunteeringActivityModel(
              id: "1",
              campaignId: "camp1",
              organizationId: "org1",
              numberOfHours: 5,
              role: "Helper"),
          VolunteeringActivityModel(
              id: "2",
              campaignId: "camp2",
              organizationId: "org2",
              numberOfHours: 10,
              role: "Coordinator"),
        ];
      case UserRole.organization:
        return [
          Campaign(
              id: "1",
              coverImageLink: "https://example.com/cover1.jpg",
              title: "Campaign 1",
              description: "Description 1",
              createdAt: DateTime.now(),
              organizationId: user.id),
          Campaign(
              id: "2",
              coverImageLink: "https://example.com/cover2.jpg",
              title: "Campaign 2",
              description: "Description 2",
              createdAt: DateTime.now(),
              organizationId: user.id),
        ];
      default:
        return [];
    }
  }

  String _getActivitiesTitle(UserRole? role) {
    switch (role) {
      case UserRole.donor:
        return "Your Donations";
      case UserRole.volunteer:
        return "Your Volunteering Activities";
      case UserRole.organization:
        return "Your Campaigns";
      default:
        return "Activities";
    }
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
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(150)),
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
              )),
              const SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: () => logout(),
                  child: const Text('Logout'),
                )
              ),
              const SizedBox(height: 25),
              UserDetails(name: currentUser!.name, email: currentUser!.email),
              const SizedBox(height: 40),
              Text(
                _getActivitiesTitle(currentUser!.role),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ActivityList(role: currentUser!.role, activities: activities),
            ],
          ),
        ),
      ),
    );
  }
}
