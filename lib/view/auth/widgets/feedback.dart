import 'package:flutter/material.dart';
import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/view/component/custom_appar.dart';
import 'package:graduationproject/view/component/custom_button.dart';
import 'package:graduationproject/view/component/custom_complaint.dart';
import 'package:graduationproject/view/component/custom_field.dart';

class FeedBack extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);

  const FeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        onTap: (value) {},
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              label: " "),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.campaign,
                size: 35,
              ),
              label: " "),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: " "),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.stars_rounded,
                size: 35,
              ),
              label: " "),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.settings, size: 35, color: primarycolor),
              label: " "),
        ],
        backgroundColor: Colors.black,
      ),
      appBar: AppBar(backgroundColor: Colors.white70, elevation: 0.0, actions: [
        CustomAppar(),
      ]),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 130,
                    width: 130,
                    child: Image.asset(
                      ImagesPaths.feedback,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomField(
                  text: "Event Name",
                  hiinttext: "Please Enter Event Name",
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Choose Feedback",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey[800]),
                ),
                const SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomComplaints(title: "Suggestions"),
                      const SizedBox(
                        width: 15,
                      ),
                      CustomComplaints(title: "Complaints"),
                      const SizedBox(
                        width: 15,
                      ),
                      CustomComplaints(title: " Message  "),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Details",
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
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Please Write More Details",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(title: "Add"),
              ],
            ),
          )),
    );
  }
}
