import 'package:flutter/material.dart';
import 'package:graduationproject/models/campaign_model.dart';
import 'package:graduationproject/models/donation_model.dart';
import 'package:graduationproject/services/campaign_service.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/utils_method.dart';

class DonorActivityItem extends StatefulWidget {
  final Donation donation;

  const DonorActivityItem({required this.donation, Key? key}) : super(key: key);

  @override
  State<DonorActivityItem> createState() => _DonorActivityItemState();
}

class _DonorActivityItemState extends State<DonorActivityItem> {
  String organizationName = "";

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final Campaign organization = await CampaignService()
          .getCampaignById(widget.donation.receivingCampaignId);
      organizationName = organization.title;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: PRIMARY_COLOR),
      ),
      child: ExpansionTile(
        title: Text(
          "Donation: \$${widget.donation.amount}",
          style: const TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Campaign: ${organizationName}",
          style: TextStyle(color: PRIMARY_COLOR.withOpacity(0.7)),
        ),
        iconColor: PRIMARY_COLOR,
        children: [
          ListTile(
            title: Text(
              "Periodicity: ${widget.donation.periodicity.toString().split('.').last}",
              style: const TextStyle(color: PRIMARY_COLOR),
            ),
            subtitle: Text(
              "Date: ${formateDate(widget.donation.createdAt.toLocal())}",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
