import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduationproject/model/model_pic.dart';
import 'package:graduationproject/view/component/custom_appar.dart';

class AboutUsDon extends StatelessWidget {
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
                color: primarycolor,
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
              icon: Icon(Icons.settings, size: 35),
              label: " "),
        ],
        backgroundColor: Colors.black,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0.0,
        actions: [
          CustomAppar(),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: SingleChildScrollView(
          child: Column(children: [
            const Text(
              "About Us",
              style: TextStyle(
                  color: primarycolor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 180,
              width: 330,
              child: Image.asset(
                AssetModel.about,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "With our application, the spirit of kindness and solidarity permeates every aspect of the experience. We provide a user-friendly interface that enables volunteers to easily browse charitable campaigns and participate in events that match their interests and skills For donors, we offer opportunities for financial contributions through secure and reliable methods.",
              style: TextStyle(fontSize: 15),
            ),
            const Text(
              "We encourage interaction and foster communication between volunteers and donors, contributing to the creation of a compassionate and connected community. Our technology features interactive elements that allow users to track the impact of their contributions and witness the success stories of the campaigns they have participated in.",
              style: TextStyle(fontSize: 15),
            ),
            const Text(
              "If you are seeking an opportunity to make a positive impact and contribute to building a better future, you are in the right place. Join our application today and become part of a community that considers change and giving as fundamental to life.",
              style: TextStyle(fontSize: 15),
            )
          ]),
        ),
      ),
    );
  }
}
