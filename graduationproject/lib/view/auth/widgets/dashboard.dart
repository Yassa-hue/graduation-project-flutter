import 'package:flutter/material.dart';
import 'package:graduationproject/model/model_pic.dart';
import 'package:graduationproject/view/component/custom_appar.dart';

class DashBoard extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);

  const DashBoard({super.key});

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
                color: primarycolor,
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
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Dash Board",
                  style: TextStyle(
                      color: primarycolor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 170,
                  ),
                  children: [
                    Image.asset(AssetModel.first),
                    Image.asset(AssetModel.second),
                    Image.asset(AssetModel.third),
                    Image.asset(AssetModel.fourth),
                    Image.asset(AssetModel.fifth),
                    Image.asset(AssetModel.sex),
                    Image.asset(AssetModel.seven),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
