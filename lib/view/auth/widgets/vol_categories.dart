import 'package:flutter/material.dart';
import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/components/custom_app_bar.dart';
import 'package:graduationproject/components/custom_card.dart';

class Categories extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);

  const Categories({super.key});

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
                color: primarycolor,
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
              icon: Icon(Icons.settings, size: 35),
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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Volunteer Categories",
                    style: TextStyle(
                        color: primarycolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 170,
                    ),
                    children: [
                      CustomCard(text: "Clothes", img: ImagesPaths.clothes),
                      CustomCard(text: "Food", img: ImagesPaths.food),
                      CustomCard(text: "House", img: ImagesPaths.house),
                      CustomCard(text: "Medicine", img: ImagesPaths.medicine),
                      CustomCard(text: "Education", img: ImagesPaths.education),
                      CustomCard(text: "Build", img: ImagesPaths.build),
                    ],
                  )
                ]),
          )),
    );
  }
}
