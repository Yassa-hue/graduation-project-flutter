import 'package:flutter/material.dart';
import 'package:graduationproject/components/profile_page/activity_list.dart';
import 'package:graduationproject/components/profile_page/user_details.dart';
import 'package:graduationproject/services/campaign_service.dart';
import 'package:graduationproject/services/donation_service.dart';
import 'package:graduationproject/services/volunteering_activity_service.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
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
    Future.delayed(Duration.zero, () async {
      currentUser = AuthProvider.of(context)!.currentUser;
      activities = await _getActivitiesForUser(currentUser);
      setState(() {});
    });
  }

  Future<List<dynamic>> _getActivitiesForUser(UserModel? user) async {
    if (user == null) return [];

    try {
      switch (user.role) {
        case UserRole.donor:
          return await DonationService().getDonationsByDonor(user.id);
        case UserRole.volunteer:
          return await VolunteeringActivityService()
              .getVolunteeringActivitiesByVolunteer(user.id);
        case UserRole.organization:
          return await CampaignService().getCampaignsByOrganization(user.id);
        default:
          return [];
      }
    } catch (error) {
      return [];
    }
  }

  String _getActivitiesTitle(UserRole? role) {
    switch (role) {
      case UserRole.donor:
        return "My Donations";
      case UserRole.volunteer:
        return "My Volunteering Activities";
      case UserRole.organization:
        return "My Campaigns";
      default:
        return "Activities";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("My Profile"),
          backgroundColor: Colors.white70,
          elevation: 0.0,
          actions: const [
            CustomAppBar(),
          ]),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: currentUser == null
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : SingleChildScrollView(
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
                    )),
                    const SizedBox(height: 25),
                    Center(
                      child: UserDetails(
                        name: currentUser!.name,
                        email: currentUser!.email,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      _getActivitiesTitle(currentUser!.role),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ActivityList(
                        role: currentUser!.role, activities: activities),
                  ],
                ),
              ),
      ),
    );
  }
}
