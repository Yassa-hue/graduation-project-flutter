import 'package:flutter/material.dart';
import 'package:graduationproject/models/volunteering_activity_model.dart';
import 'package:graduationproject/utils/color_palette.dart';

class VolunteerActivityItem extends StatelessWidget {
  final VolunteeringActivityModel activity;

  const VolunteerActivityItem({required this.activity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: PRIMARY_COLOR.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: PRIMARY_COLOR),
      ),
      child: ExpansionTile(
        title: Text(
          "Campaign: ${activity.campaignId}",
          style: const TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Role: ${activity.role}",
          style: TextStyle(color: PRIMARY_COLOR.withOpacity(0.7)),
        ),
        iconColor: PRIMARY_COLOR,
        children: [
          ListTile(
            title: Text(
              "Hours: ${activity.numberOfHours}",
              style: const TextStyle(color: PRIMARY_COLOR),
            ),
            subtitle: Text(
              "Organization ID: ${activity.organizationId}",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
