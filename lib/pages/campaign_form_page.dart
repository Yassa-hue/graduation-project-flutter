import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduationproject/components/custom_image_picker.dart';
import 'package:graduationproject/models/campaign_model.dart';
import 'package:graduationproject/models/user_model.dart';
import 'package:graduationproject/pages/page_manager.dart';
import 'package:graduationproject/services/campaign_service.dart';

import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/AuthProvider.dart';

import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/components/custom_button.dart';
import 'package:graduationproject/utils/constants.dart';
import 'package:intl/intl.dart';

class CampaignFormPage extends StatefulWidget {
  final Campaign? campaign;

  const CampaignFormPage({Key? key, this.campaign}) : super(key: key);

  @override
  State<CampaignFormPage> createState() => _CampaignFormPageState();
}

class _CampaignFormPageState extends State<CampaignFormPage> {
  String campaignName = '', campaignDetails = '', errorMsg = "";
  String? campaignImageLink;

  bool loading = false, isInputDataComplete = false;

  DateTime? campaignDate;
  File? campaignImage;

  void checkDataIsComplete() {
    errorMsg = "";

    isInputDataComplete = campaignName.isNotEmpty &&
        campaignDetails.isNotEmpty &&
        campaignDate != null &&
        (campaignImage != null || campaignImageLink != null);
  }

  @override
  void initState() {
    super.initState();
    if (widget.campaign != null) {
      setState(() {
        campaignName = widget.campaign?.title ?? '';
        campaignDetails = widget.campaign?.description ?? '';
        campaignImageLink = widget.campaign?.coverImageLink ?? '';
        campaignDate = widget.campaign?.createdAt;
      });
    }
  }

  Future<void> saveCampaign() async {
    setState(() {
      loading = true;
      errorMsg = "";
    });

    campaignImageLink = await CampaignService().uploadImage(campaignImage!);

    UserModel currentUser = AuthProvider.of(context)!.currentUser!;

    try {
      Campaign campaign = Campaign(
        id: widget.campaign?.title ?? '',
        organizationId: currentUser.id,
        title: campaignName,
        description: campaignDetails,
        coverImageLink: campaignImageLink!,
        createdAt: DateTime.now(),
      );

      if (widget.campaign != null) {
        await CampaignService().updateCampaign(campaign);
      } else {
        await CampaignService().createCampaign(campaign);
      }

      Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => MainPage(currentPage: profilePage,)));
    } catch (e) {
      setState(() {
        errorMsg = e.toString();
      });
    }

    setState(() {
      loading = false;
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
                CustomImagePicker(
                  defaultImageLink: campaignImageLink,
                  onImageIsSelected: (imageFile) {
                    setState(() {
                      campaignImage = imageFile;

                      checkDataIsComplete();
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Event Image",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.grey[800]),
                  ),
                ),
                const SizedBox(
                  height: 20,
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

                      checkDataIsComplete();
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
                InkWell(
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: campaignDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null && pickedDate != campaignDate) {
                      setState(() {
                        campaignDate = pickedDate;

                        checkDataIsComplete();
                      });
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      hintText: "Please Enter Event Date",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      campaignDate != null
                          ? DateFormat('MMMM dd, yyyy').format(campaignDate!)
                          : 'Please Enter Event Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: campaignDate != null
                            ? Colors.grey[800]
                            : Colors.grey,
                      ),
                    ),
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

                        checkDataIsComplete();
                      })
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  title: "Save",
                  onTap: () => saveCampaign(),
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
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }
}
