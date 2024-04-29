import 'package:flutter/material.dart';
import 'package:graduationproject/model/model_pic.dart';
import 'package:graduationproject/view/component/custom_appar.dart';
import 'package:graduationproject/view/component/custom_button.dart';
import 'package:graduationproject/view/component/custom_complaint.dart';

class FeedbackDon extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        onTap: (value) {},
        items: [
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
                Icons.handshake,
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
                Icons.money_sharp,
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
                      AssetModel.feedback,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Event Name",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey[800]),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  cursorColor: primarycolor,
                  decoration: InputDecoration(
                    hintText: "Please Enter Event Name",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Choose Feedback",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey[800]),
                ),
                SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomComplaints(title: "Suggestions"),
                      SizedBox(
                        width: 15,
                      ),
                      CustomComplaints(title: "Complaints"),
                      SizedBox(
                        width: 15,
                      ),
                      CustomComplaints(title: " Message  "),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Details",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.grey[800])),
                SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: Colors.grey)),
                  height: 200,
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Please Write More Details",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(title: "Add"),
              ],
            ),
          )),
    );
  }
}
