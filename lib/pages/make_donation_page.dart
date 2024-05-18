import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/components/custom_bottom_bar.dart';
import 'package:graduationproject/components/custom_button.dart';
import 'package:graduationproject/models/campaign_model.dart';
import 'package:graduationproject/models/donation_model.dart';
import 'package:graduationproject/pages/profile_page.dart';
import 'package:graduationproject/services/campaign_service.dart';
import 'package:graduationproject/services/donation_service.dart';

import 'package:graduationproject/utils/constants.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/components/dismiss_keyboard_on_tap.dart';

class MakeDonationPage extends StatefulWidget {
  const MakeDonationPage({super.key});

  @override
  State<MakeDonationPage> createState() => _MakeDonationPageState();
}

class _MakeDonationPageState extends State<MakeDonationPage> {
  final TextEditingController _amountController = TextEditingController();
  int? _selectedAmount = 10;
  Periodicity _periodicity = Periodicity.weekly;

  final List<int> donationAmounts = [10, 30, 50, 100, 200];

  Campaign? _selectedCampaign;
  List<Campaign> _campaigns = [];

  @override
  void initState() {
    super.initState();
    try {
      CampaignService().getLatestCampaigns().then((data) {
        setState(() {
          _campaigns = data;
        });
      });
    } catch (e) {
      // Handle the error here
      print('Error fetching campaigns: $e');
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> makeDonation() async {
    var currentUser = AuthProvider.of(context)!.currentUser;

    Donation newDonation = Donation(
      donorId: currentUser!.id,
      amount: _selectedAmount!.toDouble(),
      receivingOrganizationId: _selectedCampaign!.id,
      periodicity: _periodicity,
      createdAt: DateTime.now(),
    );

    try {
      await DonationService().createDonation(newDonation);

      Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()));
    } catch (e) {
      // Handle the error here
      print('Error creating donation: $e');
    }
  }

  Widget selectableCard<T>(
      {required T value,
      required T groupValue,
      required String label,
      required ValueChanged<T> onChanged}) {
    bool isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Card(
        color: isSelected ? PRIMARY_COLOR : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: isSelected
              ? BorderSide.none
              : const BorderSide(color: Colors.grey),
        ),
        elevation: isSelected ? 5 : 1,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(currentPage: donationPage),
      appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0.0,
          actions: const [
            CustomAppBar(),
          ]),
      body: DismissKeyboardOnTap(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "Donate Now ",
                      style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 60),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: donationAmounts
                        .map((amount) => selectableCard<int>(
                              value: amount,
                              groupValue: _selectedAmount!,
                              label: '\$$amount',
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedAmount = newValue;
                                });
                              },
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: TextField(
                      controller: _amountController,
                      onChanged: (value) => setState(() {
                        _selectedAmount = int.tryParse(value);
                      }),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Other Amount: ",
                        prefixText: "\$ ",
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter
                            .digitsOnly // Allows only digits to be entered
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildDropdownMenu(),
                  const SizedBox(height: 30),
                  const Text(
                    "Is this donation periodic?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: Periodicity.values
                        .map((option) => selectableCard<Periodicity>(
                              value: option,
                              groupValue: _periodicity,
                              label: option.toString().split('.').last,
                              onChanged: (newValue) {
                                setState(() {
                                  _periodicity = newValue;
                                });
                              },
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    title: "Confirm",
                    onTap: () => makeDonation(),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            )),
      ),
    );
  }

  Widget buildDropdownMenu() {
    return DropdownButtonFormField<Campaign>(
      decoration: const InputDecoration(
        labelText: 'Choose the event to donate to',
        border: OutlineInputBorder(),
      ),
      value: _selectedCampaign,
      onChanged: (Campaign? newValue) {
        setState(() {
          _selectedCampaign = newValue;
        });
      },
      items: _campaigns.map<DropdownMenuItem<Campaign>>((Campaign campaign) {
        return DropdownMenuItem<Campaign>(
          value: campaign,
          child: Text(campaign.title),
        );
      }).toList(),
    );
  }
}
