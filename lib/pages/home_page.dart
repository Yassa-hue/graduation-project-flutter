import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:graduationproject/pages/donation_page.dart';

import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/components/custom_bottom_bar.dart';

import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/constants.dart';

import 'package:graduationproject/models/campaign_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(currentPage: homePage),
      appBar: AppBar(backgroundColor: Colors.white70, elevation: 0.0, actions: const [
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
              Text(
                "Latest Campaigns",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    fontSize: 15),
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: 200,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("campaigns")
                      .orderBy('createdAt', descending: true)
                      .limit(3)
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    try {
                      if (!snapshot.hasData || snapshot.hasError) {
                        throw "No data found";
                      }

                      List<Campaign> campaigns = snapshot.data?.docs
                              .map((doc) => Campaign.fromJson(doc.data()))
                              .toList() ??
                          [];

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: campaigns.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 300,
                            height: 120,
                            padding: const EdgeInsets.fromLTRB(0, 8, 10, 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                campaigns[index].coverImageLink,
                                width: 300,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    } catch (e) {
                      return const Center(
                          child:
                              CircularProgressIndicator(color: PRIMARY_COLOR));
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DonationPage()));
                  },
                  color: Colors.black,
                  child: const Text(
                    "Donate Now  >",
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
