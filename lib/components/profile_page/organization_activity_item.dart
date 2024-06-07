import 'package:flutter/material.dart';
import 'package:graduationproject/models/campaign_model.dart';
import 'package:graduationproject/pages/campaign_details_page.dart';
import 'package:graduationproject/utils/color_palette.dart';

class OrganizationActivityItem extends StatelessWidget {
  final Campaign campaign;

  const OrganizationActivityItem({required this.campaign, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: PRIMARY_COLOR),
      ),
      child: Column(
        children: [
          ExpansionTile(
            title: Text(
              campaign.title,
              style: const TextStyle(
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              campaign.description,
              style: TextStyle(color: PRIMARY_COLOR.withOpacity(0.7)),
            ),
            iconColor: PRIMARY_COLOR,
            children: [
              ListTile(
                title: Text(
                  "Created At: ${campaign.createdAt.toLocal()}",
                  style: const TextStyle(color: PRIMARY_COLOR),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Campaign Image:",
                      style: TextStyle(
                        color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Image.network(
                      campaign.coverImageLink,
                      fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CampaignDetailsPage(
                                    campaign: campaign,
                                  )));
                      },
                      child: const Text('Show in Detail'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
