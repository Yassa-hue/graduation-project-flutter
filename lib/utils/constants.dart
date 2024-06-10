import 'package:graduationproject/utils/images_paths.dart';

const List donationCategories = [
    {"image": ImagesPaths.education, "title": "Education"},
    {"image": ImagesPaths.food, "title": "Food"},
    {"image": ImagesPaths.clothes, "title": "Clothes"},
    {"image": ImagesPaths.medicine, "title": "Medicine"},
    {"image": ImagesPaths.house, "title": "House"},
    {"image": ImagesPaths.build, "title": "Build"},
];

const int profilePage = 0;
const int campainPage = 1;
const int homePage = 2;
const int donationPage = 3;
const int settingsPage = 4;
const int campainsFeedPage = 1;
const int volunteeringPage = 3;

enum PaymentMethod {
  visa,
  meza,
  smartWallet,
  vodafoneCash,
}
