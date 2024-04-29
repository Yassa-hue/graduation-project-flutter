import 'package:flutter/material.dart';
import 'package:graduationproject/model/model_pic.dart';
import 'package:graduationproject/view/component/custom_appar.dart';
import 'package:graduationproject/view/component/custom_profile.dart';

class AdminProfile extends StatelessWidget {
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
                color: primarycolor,
              ),
              label: " "),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.add,
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
                Icons.star,
                size: 35,
              ),
              label: " "),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.monitor_heart,
                size: 35,
              ),
              label: " "),
        ],
        backgroundColor: Colors.black,
      ),
      appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0.0,
          actions: [CustomAppar()]),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(150)),
                            border: Border.all(
                                color: Color.fromARGB(255, 225, 223, 223),
                                width: 3)),
                        height: 150,
                        width: 150,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child: Image.asset(
                              AssetModel.adminp,
                              width: 100,
                              height: 100,
                            ))),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Ramy Omar Sad",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Product owner",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Container(
                width: 360,
                height: 340,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    children: [
                      CustomProfile(icon: Icons.person, text: "Edit Account"),
                      Divider(
                        color: Colors.grey,
                        indent: 10,
                        endIndent: 10,
                      ),
                      CustomProfile(
                        icon: Icons.photo,
                        text: "Edit Photo             ",
                        icon2: Icons.navigate_next_sharp,
                      ),
                      Divider(
                        color: Colors.grey,
                        indent: 10,
                        endIndent: 10,
                      ),
                      CustomProfile(
                        icon: Icons.change_circle_outlined,
                        text: "Change Name       ",
                        icon2: Icons.navigate_next_sharp,
                      ),
                      Divider(
                        color: Colors.grey,
                        indent: 10,
                        endIndent: 10,
                      ),
                      CustomProfile(
                          icon: Icons.password,
                          text: "Change Password",
                          icon2: Icons.navigate_next_sharp),
                      Divider(
                        color: Colors.grey,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 40,
                        width: 350,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.notifications_on,
                              color: primarycolor,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Notification",
                              style: TextStyle(
                                  color: primarycolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 140,
                            ),
                            Switch(
                              value: true,
                              onChanged: (val) {},
                              activeTrackColor: primarycolor,
                              activeColor: Colors.grey[200],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        indent: 10,
                        endIndent: 10,
                      ),
                      CustomProfile(
                        icon: Icons.privacy_tip,
                        text: "Privacy Setting     ",
                        icon2: Icons.navigate_next_sharp,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
