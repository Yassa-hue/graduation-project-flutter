import 'package:flutter/material.dart';
import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/models/campaign_model.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:graduationproject/pages/campaign_form_page.dart';
import 'package:graduationproject/pages/make_donation_page.dart';
import 'package:graduationproject/pages/page_manager.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/constants.dart';
import 'package:graduationproject/utils/utils_method.dart';

class CampaignDetailsPage extends StatefulWidget {
  final Campaign campaign;

  const CampaignDetailsPage({Key? key, required this.campaign})
      : super(key: key);

  @override
  State<CampaignDetailsPage> createState() => _CampaignDetailsPageState();
}

class _CampaignDetailsPageState extends State<CampaignDetailsPage> {
  UserModel? currentUser;

  void onActionButtonPressed() {
    switch (currentUser!.role) {
      case UserRole.donor:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MakeDonationPage(
                      selectedCampaign: widget.campaign,
                    )));
        break;
      case UserRole.organization:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CampaignFormPage(
                      campaign: widget.campaign,
                    )));
        break;
      case UserRole.volunteer:
        // TODO: Fix this when creating the volunteer pages
        break;
      default:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainPage(
                      currentPage: homePage,
                    )));
    }
  }

  String getActionButtonMsg() {
    switch (AuthProvider.of(context)?.currentUser!.role) {
      case UserRole.donor:
        return "Make Donation >";
      case UserRole.organization:
        return "Edit Campaign >";
      case UserRole.volunteer:
        return "Volunteer >";
      default:
        return "Make Donation";
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      currentUser = AuthProvider.of(context)?.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0.0,
          actions: const [
            CustomAppBar(),
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.campaign.coverImageLink,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.campaign.title,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: PRIMARY_COLOR),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.campaign.description,
                    style: TextStyle(fontSize: 16, color: SECONDARY_COLOR),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Date: ${formateDate(widget.campaign.createdAt)}',
                    style: TextStyle(fontSize: 16, color: SECONDARY_COLOR),
                  ),
                  if (currentUser != null &&
                      (currentUser!.role == UserRole.organization ||
                          currentUser!.id == widget.campaign.organizationId))
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      height: 100,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: onActionButtonPressed,
                        color: Colors.black,
                        child: Text(
                          getActionButtonMsg(),
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
