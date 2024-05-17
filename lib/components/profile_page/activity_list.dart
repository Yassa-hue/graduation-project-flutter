import 'package:flutter/material.dart';
import 'package:graduationproject/components/profile_page/donor_activity_item.dart';
import 'package:graduationproject/components/profile_page/organization_activity_item.dart';
import 'package:graduationproject/components/profile_page/volunteer_activity_item.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:graduationproject/models/donation_model.dart';
import 'package:graduationproject/models/volunteering_activity_model.dart';
import 'package:graduationproject/models/campaign_model.dart';

class ActivityList extends StatelessWidget {
  final UserRole role;
  final List<dynamic> activities;

  const ActivityList({required this.role, required this.activities, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        switch (role) {
          case UserRole.donor:
            return DonorActivityItem(donation: activity as Donation);
          case UserRole.volunteer:
            return VolunteerActivityItem(
                activity: activity as VolunteeringActivityModel);
          case UserRole.organization:
            return OrganizationActivityItem(campaign: activity as Campaign);
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
