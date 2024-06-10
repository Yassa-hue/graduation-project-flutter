import 'package:flutter/material.dart';
import 'package:graduationproject/components/Custom_payment.dart';
import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/components/custom_button.dart';
import 'package:graduationproject/models/donation_model.dart';
import 'package:graduationproject/pages/page_manager.dart';
import 'package:graduationproject/services/donation_service.dart';
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
  PaymentMethod _paymentMethod = PaymentMethod.visa;
  bool loading = false;
  String errorMsg = "";

  Future<void> makeDonation() async {
    setState(() {
      loading = true;
      errorMsg = "";
    });

    try {
      await DonationService().createDonation(widget.newDonation);
      Navigator.push(
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
            CustomPayment(
                text: "Credit Card",
                img: ImagesPaths.visa,
                paymentMethod: PaymentMethod.visa,
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() {
                    _paymentMethod = value!;
                    errorMsg = "";
                  });
                }),
            SizedBox(
              height: 18,
            ),
            CustomPayment(
              text: "Credit Card",
              img: ImagesPaths.meza,
              paymentMethod: PaymentMethod.meza,
              groupValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value!;
                  errorMsg = "";
                });
              },
            ),
            SizedBox(
              height: 18,
            ),
            CustomPayment(
              text: "Smart Wallet",
              img: ImagesPaths.smart_wallet,
              paymentMethod: PaymentMethod.smartWallet,
              groupValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value!;
                  errorMsg = "";
                });
              },
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
              paymentMethod: PaymentMethod.vodafoneCash,
              groupValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value!;
                  errorMsg = "";
                });
              },
            ),
            SizedBox(
              height: 40,
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
            errorMsg.isEmpty
                ? const SizedBox()
                : const SizedBox(
                    height: 15,
                  ),
            CustomButton(
                title: "Confirm Payment",
                isLoading: loading,
                onTap: () {
                  makeDonation();
                }),
          ]),
        ),
      ),
    );
  }
}
