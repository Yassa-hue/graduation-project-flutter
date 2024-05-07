import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/components/custom_bottom_bar.dart';
import 'package:graduationproject/components/custom_button.dart';
import 'package:graduationproject/models/campaign_model.dart';

import 'package:graduationproject/utils/constants.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/utils.dart';

class MakeDonationPage extends StatefulWidget {
  const MakeDonationPage({super.key});

  @override
  State<MakeDonationPage> createState() => _MakeDonationPageState();
}

class _MakeDonationPageState extends State<MakeDonationPage> {
  final TextEditingController _amountController = TextEditingController();
  int? _selectedAmount = 10;
  String? _periodicity = "Weekly";

  final List<int> donationAmounts = [10, 30, 50, 100, 200];
  final List<String> periodicityOptions = ["Weekly", "Monthly", "Annually"];

  Campaign? _selectedCampaign;
  List<Campaign> _campaigns = [];

  @override
  void initState() {
    super.initState();
    fetchCampaigns().then((data) {
      setState(() {
        _campaigns = data;
      });
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
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
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    children: periodicityOptions
                        .map((option) => selectableCard<String>(
                              value: option,
                              groupValue: _periodicity!,
                              label: option,
                              onChanged: (newValue) {
                                setState(() {
                                  _periodicity = newValue;
                                });
                              },
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 50),
                  CustomButton(title: "Confirm"),
                  const SizedBox(height: 50),
                ],
              ),
            )),
      ),
    );
  }

  Future<List<Campaign>> fetchCampaigns() async {
    var snapshot =
        await FirebaseFirestore.instance.collection('campaigns').get();
    return snapshot.docs.map((doc) => Campaign.fromJson(doc.data())).toList();
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
