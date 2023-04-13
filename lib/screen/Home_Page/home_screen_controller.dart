import 'package:car_rental_admin/screen/Add_Car_Page/add_car_screen.dart';
import 'package:car_rental_admin/screen/Add_Car_Page/add_car_screen_controller.dart';
import 'package:car_rental_admin/screen/Profile_page/profile_screen.dart';
import 'package:car_rental_admin/screen/notification_page/notification_screen.dart';
import 'package:car_rental_admin/screen/sign_in_screen/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final auth = FirebaseAuth.instance;

  DatabaseReference database =
      FirebaseDatabase.instance.ref('Admin').child('AddCar');
  List<Map<String?, dynamic>> carListShow = [];

  @override
  void onInit() {
    // TODO: implement onInit
    getCarData();
    super.onInit();
  }

  Future<void> getCarData() async {
    await database.once().then((value) {
      Map temp = value.snapshot.value as Map;
      print(temp);
      temp.forEach((key, value) {
        carListShow.add(
          {
            "key": key,
            "title": value["CarName"],
            "subtitle": value["GearBox"],
            "price": value["CarPrice"],
            "image": value["CarImage"][0],
          },
        );
      });
    });
    update(["cars"]);
  }

  void addCar() {
    Get.put(AddCarScreenController());
    Get.to(() => const AddCarScreen())?.then((value) {
      carListShow.add(
        {
          "title": value["CarName"],
          "subtitle": value["GearBox"],
          "price": value["CarPrice"],
          "image": value["CarImage"][0],
        },
      );
    });
  }

  void notification() {
    Get.to(() => const NotificationScreen());
  }

  void signInScreen() {
    Get.to(() => const SignInScreen());
  }

  void editCarDetails(String key) {
    AddCarScreenController controller = Get.put(AddCarScreenController());
    controller.onTepEdit(key);
    Get.to(() => const AddCarScreen());
  }

  void profileScreen(){
    Get.to(()=>const ProfileScreen());
  }
}
