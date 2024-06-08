import 'package:flutter/material.dart';
import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/models/campaign_model.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:graduationproject/pages/apply_for_volunteering_page.dart';
import 'package:graduationproject/pages/campaign_form_page.dart';
import 'package:graduationproject/pages/make_donation_page.dart';
import 'package:graduationproject/pages/page_manager.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/constants.dart';
import 'package:graduationproject/utils/utils_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CampaignDetailsPage extends StatefulWidget {
  final Campaign campaign;

  const CampaignDetailsPage({Key? key, required this.campaign})
      : super(key: key);

  @override
  State<CampaignDetailsPage> createState() => _CampaignDetailsPageState();
}

class _CampaignDetailsPageState extends State<CampaignDetailsPage> {
  UserModel? currentUser;
  String? organizerName;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentUser = AuthProvider.of(context)?.currentUser;
    });
    fetchOrganizerName();
  }

  Future<void> fetchOrganizerName() async {
    DocumentSnapshot organizerSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.campaign.organizationId)
        .get();
    setState(() {
      organizerName = organizerSnapshot['name'];
    });
  }

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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ApplyForVolunteeringPage(
                      campaign: widget.campaign,
                    )));
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Campaign Details',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: const [CustomAppBar()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.campaign.coverImageLink,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
              SizedBox(height: 16),
              Text(
                widget.campaign.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: PRIMARY_COLOR,
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.campaign.description,
                style: TextStyle(fontSize: 16, color: SECONDARY_COLOR),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.calendar_today, color: SECONDARY_COLOR),
                  SizedBox(width: 8),
                  Text(
                    'Date: ${formateDate(widget.campaign.createdAt)}',
                    style: TextStyle(fontSize: 16, color: SECONDARY_COLOR),
                  ),
                ],
              ),
              SizedBox(height: 16),
              organizerName != null
                  ? Row(
                      children: [
                        Icon(Icons.person, color: SECONDARY_COLOR),
                        SizedBox(width: 8),
                        Text(
                          'Organizer: $organizerName',
                          style:
                              TextStyle(fontSize: 16, color: SECONDARY_COLOR),
                        ),
                      ],
                    )
                  : CircularProgressIndicator(),
              SizedBox(height: 16),
              if (currentUser != null &&
                  (currentUser!.role == UserRole.organization ||
                      currentUser!.id == widget.campaign.organizationId))
                Center(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: MaterialButton(
                      height: 60,
                      onPressed: onActionButtonPressed,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        getActionButtonMsg(),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
