import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/components/custom_button.dart';
import 'package:graduationproject/components/custom_field.dart';
import 'package:graduationproject/components/dismiss_keyboard_on_tap.dart';
import 'package:graduationproject/models/campaign_model.dart';
import 'package:graduationproject/models/volunteering_activity_model.dart';
import 'package:graduationproject/pages/page_manager.dart';
import 'package:graduationproject/services/campaign_service.dart';
import 'package:graduationproject/services/volunteering_activity_service.dart';
import 'package:graduationproject/utils/AuthProvider.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/constants.dart';

class ApplyForVolunteeringPage extends StatefulWidget {
  final Campaign? campaign;

  const ApplyForVolunteeringPage({Key? key, this.campaign}) : super(key: key);

  @override
  State<ApplyForVolunteeringPage> createState() =>
      _ApplyForVolunteeringPageState();
}

class _ApplyForVolunteeringPageState extends State<ApplyForVolunteeringPage> {
  final TextEditingController _amountController = TextEditingController();
  String errorMsg = "", role = "";
  int numOfHours = 1;

  Campaign? _selectedCampaign;
  List<Campaign> _campaigns = [];

  bool loading = false, isInputDataComplete = false;

  @override
  void initState() {
    super.initState();
    try {
      CampaignService().getCampaigns().then((data) {
        setState(() {
          _campaigns = data;

          String selectedCampaignId = widget.campaign?.id ?? "";
          _selectedCampaign = _campaigns.firstWhere(
              (campaign) => campaign.id == selectedCampaignId,
              orElse: () => data.first);
        });
      });
    } catch (e) {
      setState(() {
        errorMsg = e.toString();
      });
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void checkInputData() {
    errorMsg = "";

    isInputDataComplete = role.isNotEmpty && _selectedCampaign != null;
  }

  Future<void> saveActivity() async {
    setState(() {
      loading = true;
      errorMsg = "";
    });

    var currentUser = AuthProvider.of(context)!.currentUser;

    try {
      VolunteeringActivityModel volunteeringActivity =
          VolunteeringActivityModel(
              campaignId: _selectedCampaign!.id,
              volunteerId: currentUser!.id,
              organizationId: _selectedCampaign!.organizationId,
              numberOfHours: numOfHours,
              role: role);

      await VolunteeringActivityService()
          .addVolunteeringActivity(volunteeringActivity);

      Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
              builder: (context) => MainPage(
                    currentPage: profilePage,
                  )));
    } catch (e) {
      setState(() {
        errorMsg = e.toString();
      });
    }

    setState(() {
      loading = false;
    });
  }

  Widget buildDropdownMenu() {
    return DropdownButtonFormField<Campaign>(
      decoration: const InputDecoration(
        labelText: 'Choose the campaign to volunteer to',
        border: OutlineInputBorder(),
      ),
      value: _selectedCampaign,
      onChanged: (Campaign? newValue) {
        setState(() {
          _selectedCampaign = newValue;

          checkInputData();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        "Volunteer Now ",
                        style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 60),
                    CustomField(
                      text: "Role",
                      hintText: "Teach children coding",
                      prefex: Icons.work,
                      onChanged: (value) => {
                        setState(() {
                          errorMsg = "";
                          role = value;

                          checkInputData();
                        })
                      },
                    ),
                    const SizedBox(height: 20),
                    buildDropdownMenu(),
                    const SizedBox(height: 30),
                    Center(
                      child: TextField(
                        controller: _amountController,
                        onChanged: (value) => setState(() {
                          numOfHours = int.tryParse(value)!;

                          checkInputData();
                        }),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "How many hours: ",
                          prefixText: "Hours: ",
                          border: OutlineInputBorder(),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^[1-9]\d*'))
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      title: "Confirm",
                      onTap: () => saveActivity(),
                      isLoading: loading,
                      disabled: !isInputDataComplete,
                    ),
                    errorMsg.isEmpty
                        ? const SizedBox()
                        : const SizedBox(
                            height: 15,
                          ),
                    (errorMsg.isNotEmpty)
                        ? Text(
                            errorMsg,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 50),
                  ],
                ),
              )),
        ));
  }
}
