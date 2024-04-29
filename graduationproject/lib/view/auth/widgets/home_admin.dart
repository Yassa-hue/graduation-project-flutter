import 'package:flutter/material.dart';
import 'package:graduationproject/model/model_pic.dart';
import 'package:graduationproject/view/component/custom_appar.dart';

// ignore: must_be_immutable
class HomeAdmin extends StatelessWidget {
  static const primarycolor = Color(0xff644AE5);
  List categories = [
    {"image": AssetModel.education, "title": "Education"},
    {"image": AssetModel.food, "title": "Food"},
    {"image": AssetModel.clothes, "title": "Clothes"},
    {"image": AssetModel.medicine, "title": "Medicine"},
    {"image": AssetModel.house, "title": "House"},
    {"image": AssetModel.build, "title": "Build"},
  ];
  List pictures = [
    {"image": AssetModel.camp1},
    {"image": AssetModel.camp2},
    {"image": AssetModel.camp3},
  ];
  HomeAdmin({super.key});
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
                color: primarycolor,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 206, 205, 205),
                            width: 3)),
                    height: 45,
                    width: 300,
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: "Add Event",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 4)),
                            suffixIcon: Icon(
                              Icons.add,
                              color: Colors.black,
                            ))),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.image,
                        size: 35,
                      ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
                    height: 130,
                    width: 360,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        AssetModel.homing,
                        width: 360,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "The Foundation helps at least 100 families and 500 individuals daily and works to pay attention to the educational and medical aspects. It also works to provide food and clothing for them and provide suitable housing for them. It works to raise the number and increase the number of people it intends to help .",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Donation Categories",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  height: 110,
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Image.asset(
                                  categories[i]["image"],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            Text(
                              categories[i]["title"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      );
                    },
                  )),
              SizedBox(
                height: 15,
              ),
              Text(
                "Latest Campaigns",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    fontSize: 15),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pictures.length,
                  itemBuilder: (context, index) {
                    return Container(
                        width: 300,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            pictures[index]["image"],
                            width: 300,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(0, 8, 10, 10));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
