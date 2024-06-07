import 'package:flutter/material.dart';

import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/pages/campaign_details_page.dart';
import 'package:graduationproject/pages/page_manager.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:graduationproject/utils/AuthProvider.dart';

import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/constants.dart';
import 'package:graduationproject/utils/images_paths.dart';

import 'package:graduationproject/models/campaign_model.dart';
import 'package:graduationproject/services/campaign_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onActionButtonPressed() {
    int togoPageId = 0;

    switch (AuthProvider.of(context)?.currentUser!.role) {
      case UserRole.donor:
        togoPageId = donationPage;
        break;
      case UserRole.organization:
        togoPageId = campainPage;
        break;
      case UserRole.volunteer:
        // TODO: Fix this when creating the volunteer pages
        togoPageId = campainPage;
        break;
      default:
        togoPageId = homePage;
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainPage(
                  currentPage: togoPageId,
                )));
  }

  String getActionButtonMsg() {
    switch (AuthProvider.of(context)?.currentUser!.role) {
      case UserRole.donor:
        return "Make Donation >";
      case UserRole.organization:
        return "Create Campaign >";
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
          backgroundColor: Colors.white70,
          elevation: 0.0,
          actions: const [
            CustomAppBar(),
          ]),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 5, 15, 0),
                    height: 130,
                    width: 360,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        ImagesPaths.homing,
                        width: 360,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "The Foundation helps at least 100 families and 500 individuals daily and works to pay attention to the educational and medical aspects. It also works to provide food and clothing for them and provide suitable housing for them. It works to raise the number and increase the number of people it intends to help .",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Donation Categories",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 110,
                  child: ListView.builder(
                    itemCount: donationCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.asset(
                                donationCategories[i]["image"],
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            donationCategories[i]["title"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          ),
                        ],
                      );
                    },
                  )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Campaigns",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainPage(currentPage: campainsFeedPage,)));
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: 200,
                child: FutureBuilder<List<Campaign>>(
                  future: CampaignService().getLatestCampaigns(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Campaign> campaigns = snapshot.data!;

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: campaigns.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CampaignDetailsPage(
                                            campaign: campaigns[index],
                                          )));
                            },
                            child: Container(
                              width: 300,
                              height: 130,
                              padding: const EdgeInsets.fromLTRB(0, 8, 10, 10),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      campaigns[index].coverImageLink,
                                      width: 300,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            campaigns[index].title,
                                            style: TextStyle(
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            campaigns[index].description,
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(color: PRIMARY_COLOR),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
