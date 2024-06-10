import 'package:flutter/material.dart';
import 'package:graduationproject/components/Custom_payment.dart';
import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/components/custom_button.dart';
import 'package:graduationproject/models/donation_model.dart';
import 'package:graduationproject/pages/page_manager.dart';
import 'package:graduationproject/utils/color_palette.dart';
import 'package:graduationproject/utils/constants.dart';
import 'package:graduationproject/utils/images_paths.dart';

// ignore: must_be_immutable
class PaymentPage extends StatefulWidget {
  final Donation newDonation;

  PaymentPage({required this.newDonation});

  @override
  State<PaymentPage> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentPage> {
  Future<void> makeDonation() async {
    Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
              builder: (context) => MainPage(
                    currentPage: profilePage,
                  )));
  }

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
                color: PRIMARY_COLOR,
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
        CustomAppBar(),
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
                    color: PRIMARY_COLOR,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomPayment(text: "Credit Card", img: ImagesPaths.visa),
            SizedBox(
              height: 18,
            ),
            CustomPayment(
              text: "Credit Card",
              img: ImagesPaths.meza,
            ),
            SizedBox(
              height: 18,
            ),
            CustomPayment(
              text: "Smart Wallet",
              img: ImagesPaths.smart_wallet,
            ),
            SizedBox(
              height: 18,
            ),
            SizedBox(
              height: 1,
            ),
            CustomPayment(
              text: "Vodafone Cash",
              img: ImagesPaths.vodafone_cash,
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
