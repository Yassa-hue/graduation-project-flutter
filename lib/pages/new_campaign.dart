import 'package:flutter/material.dart';
import 'package:graduationproject/models/campaign_model.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:graduationproject/pages/profile_page.dart';
import 'package:graduationproject/services/campaign_service.dart';

import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/constants.dart';
import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/utils/AuthProvider.dart';

import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/components/custom_bottom_bar.dart';
import 'package:graduationproject/components/custom_button.dart';

class NewCampaign extends StatefulWidget {
  const NewCampaign({super.key});

  @override
  State<NewCampaign> createState() => _NewCampaignState();
}

class _NewCampaignState extends State<NewCampaign> {
  String campaignName = '',
      campaignDetails = '',
      // TODO: Add Image Picker
      campaignImage = "https://firebasestorage.googleapis.com/v0/b/graduation-project-d349a.appspot.com/o/camp1.jpg?alt=media&token=8a200b34-8429-42bb-9257-26a3a1e8a411",
      error = "";
  
  // TODO: Add DateTime Picker
  DateTime campaignDate = DateTime.now();

  Future<void> addCampaign() async {
    // Add Campaign
    UserModel currentUser = AuthProvider.of(context)!.currentUser!;

    try {
      Campaign campaign = Campaign(
        id: "",
        organizationId: currentUser.id,
        title: campaignName,
        description: campaignDetails,
        coverImageLink: campaignImage,
        createdAt: DateTime.now(),
      );

      await CampaignService().createCampaign(campaign);

      Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
              builder: (context) => const ProfilePage()));
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(currentPage: homePage),
      appBar: AppBar(backgroundColor: Colors.white70, elevation: 0.0, actions: const [
        CustomAppBar(),
      ]),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "New Event",
                    style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 130,
                    width: 130,
                    child: Image.asset(
                      ImagesPaths.fourth,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Event Name",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey[800]),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  cursorColor: PRIMARY_COLOR,
                  decoration: InputDecoration(
                    hintText: "Please Enter Event Name",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: (value) => {
                    setState(() {
                      campaignName = value;
                    })
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Event Date",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey[800]),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  cursorColor: PRIMARY_COLOR,
                  decoration: InputDecoration(
                    hintText: "Please Enter Event Date",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text("Event Details",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.grey[800])),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: Colors.grey)),
                  height: 200,
                  width: double.infinity,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Please Write Event Details",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    onChanged: (value) => {
                      setState(() {
                        campaignDetails = value;
                      })
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                    title: "Add",
                    onTap: () => addCampaign(),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }
}
