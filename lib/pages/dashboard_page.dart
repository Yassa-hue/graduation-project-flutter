import 'package:flutter/material.dart';
import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/components/dashboard_card.dart';
import 'package:graduationproject/services/campaign_service.dart';
import 'package:graduationproject/services/donation_service.dart';
import 'package:graduationproject/services/volunteering_activity_service.dart';
import 'package:graduationproject/utils/AuthProvider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int numberOfCampaigns = 0;
  double totalDonations = 0.0;
  int totalDonors = 0;
  int totalVolunteers = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      String organizationId = AuthProvider.of(context)!.currentUser!.id;
      try {
        numberOfCampaigns =
            (await CampaignService().getCampaignsByOrganization(organizationId))
                .length;
      } catch (e) {
        print(e);
      }

      try {
        final donations =
            await DonationService().getDonationsByOrganization(organizationId);

        totalDonations = donations.fold(
            0.0, (previousValue, element) => previousValue + element.amount);
        
        totalDonors = donations.map((e) => e.donorId).toSet().length;
      } catch (e) {
        print(e);
      }

      try {
        final volunteeringActivities = await VolunteeringActivityService().getVolunteeringActivitiesByOrganization(organizationId);

        totalVolunteers = volunteeringActivities.map((e) => e.volunteerId).toSet().length;
      } catch (e) {
        print(e);
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Dashboard'),
          backgroundColor: Colors.white70,
          elevation: 0.0,
          actions: const [
            CustomAppBar(),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            DashboardCard(
              title: 'Campaigns',
              value: numberOfCampaigns.toString(),
              icon: Icons.campaign,
            ),
            DashboardCard(
              title: 'Total Donations',
              value: '\$${totalDonations.toStringAsFixed(2)}',
              icon: Icons.attach_money,
            ),
            DashboardCard(
              title: 'Total Donors',
              value: totalDonors.toString(),
              icon: Icons.people,
            ),
            DashboardCard(
              title: 'Total Volunteers',
              value: totalVolunteers.toString(),
              icon: Icons.volunteer_activism,
            ),
          ],
        ),
      ),
    );
  }
}
