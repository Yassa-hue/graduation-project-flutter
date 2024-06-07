import 'package:flutter/material.dart';
import 'package:graduationproject/models/campaign_model.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:graduationproject/models/volunteering_activity_model.dart';
import 'package:graduationproject/services/campaign_service.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/utils/color_palette.dart';

class VolunteerActivityItem extends StatefulWidget {
  final VolunteeringActivityModel activity;

  const VolunteerActivityItem({required this.activity, Key? key})
      : super(key: key);

  @override
  State<VolunteerActivityItem> createState() => _VolunteerActivityItemState();
}

class _VolunteerActivityItemState extends State<VolunteerActivityItem> {
  String organizationName = "", campaignName = "";

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final UserModel organization = await AuthProvider.of(context)!.getUserById(widget.activity.organizationId);

      final Campaign campaign = await CampaignService()
          .getCampaignById(widget.activity.campaignId);

      organizationName = organization.name;
      campaignName = campaign.title;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: PRIMARY_COLOR),
      ),
      child: ExpansionTile(
        title: Text(
          "Campaign: ${campaignName}",
          style: const TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Role: ${widget.activity.role}",
          style: TextStyle(color: PRIMARY_COLOR.withOpacity(0.7)),
        ),
        iconColor: PRIMARY_COLOR,
        children: [
          ListTile(
            title: Text(
              "Hours: ${widget.activity.numberOfHours}",
              style: const TextStyle(color: PRIMARY_COLOR),
            ),
            subtitle: Text(
              "Organization ID: ${organizationName}",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
