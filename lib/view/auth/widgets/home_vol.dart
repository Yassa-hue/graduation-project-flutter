import 'package:flutter/material.dart';
import 'package:graduationproject/utils/images_paths.dart';
import 'package:graduationproject/view/component/custom_appar.dart';

// ignore: must_be_immutable
class HomeVol extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);
  List categories = [
    {"image": ImagesPaths.education, "title": "Education"},
    {"image": ImagesPaths.food, "title": "Food"},
    {"image": ImagesPaths.clothes, "title": "Clothes"},
    {"image": ImagesPaths.medicine, "title": "Medicine"},
    {"image": ImagesPaths.house, "title": "House"},
    {"image": ImagesPaths.build, "title": "Build"},
  ];
  List pictures = [
    {"image": ImagesPaths.camp1},
    {"image": ImagesPaths.camp2},
    {"image": ImagesPaths.camp3},
  ];
  HomeVol({super.key});
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
                color: primarycolor,
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
        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 5, 15, 0),
                    height: 130,
                    width: 360,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        ImagesPaths.homing,
                        width: 360,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "The Foundation helps at least 100 families and 500 individuals daily and works to pay attention to the educational and medical aspects. It also works to provide food and clothing for them and provide suitable housing for them. It works to raise the number and increase the number of people it intends to help .",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Donation Categories",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 110,
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.asset(
                                categories[i]["image"],
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            categories[i]["title"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          ),
                        ],
                      );
                    },
                  )),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Latest Campaigns",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    fontSize: 15),
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pictures.length,
                  itemBuilder: (context, index) {
                    return Container(
                        width: 300,
                        height: 120,
                        padding: const EdgeInsets.fromLTRB(0, 8, 10, 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            pictures[index]["image"],
                            width: 300,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ));
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                height: 100,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.black,
                  child: const Text(
                    "Donate Now  >",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
