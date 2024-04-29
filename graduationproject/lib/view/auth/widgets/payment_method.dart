import 'package:flutter/material.dart';
import 'package:graduationproject/model/model_pic.dart';
import 'package:graduationproject/view/component/Custom_payment.dart';
import 'package:graduationproject/view/component/custom_appar.dart';
import 'package:graduationproject/view/component/custom_button.dart';

// ignore: must_be_immutable
class PaymentMethod extends StatelessWidget {
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
                color: primarycolor,
                size: 35,
              ),
              label: " "),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.settings,
                size: 35,
              ),
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: const Text(
                "Payment Method ",
                style: TextStyle(
                    color: primarycolor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomPayment(text: "Credit Card", img: AssetModel.fiza),
            SizedBox(
              height: 18,
            ),
            CustomPayment(
              text: "Credit Card",
              img: AssetModel.miza,
            ),
            SizedBox(
              height: 18,
            ),
            CustomPayment(
              text: "Smart Wallet",
              img: AssetModel.smartwallet,
            ),
            SizedBox(
              height: 18,
            ),
            CustomPayment(
              text: "Paypal",
              img: AssetModel.paypal,
            ),
            SizedBox(
              height: 18,
            ),
            CustomPayment(
              text: "Google Pay",
              img: AssetModel.googlepay,
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(title: "Confirm Payment"),
          ]),
        ),
      ),
    );
  }
}
