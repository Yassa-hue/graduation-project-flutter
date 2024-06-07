import 'package:flutter/material.dart';
import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/models/campaign_model.dart';
import 'package:graduationproject/pages/campaign_details_page.dart';
import 'package:graduationproject/services/campaign_service.dart';

class CampaignsFeedPage extends StatefulWidget {
  const CampaignsFeedPage({super.key});

  @override
  State<CampaignsFeedPage> createState() => _CampaignsFeedPageState();
}

class _CampaignsFeedPageState extends State<CampaignsFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white70,
            elevation: 0.0,
            actions: const [
              CustomAppBar(),
            ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Your Feed',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Campaign>>(
                future: CampaignService().getCampaigns(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    List<Campaign> campaigns = snapshot.data!;
                    return ListView.builder(
                      itemCount: campaigns.length,
                      itemBuilder: (context, index) {
                        Campaign campaign = campaigns[index];
                        return Card(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 200, // Adjust the height as needed
                                child: Image.network(
                                  campaign.coverImageLink,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ListTile(
                                title: Text(campaign.title),
                                trailing: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CampaignDetailsPage(
                                                  campaign: campaign,
                                                )));
                                  },
                                  child: Text('See More'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}
