import 'package:car_rental_admin/screen/notification_page/notification_screen.dart';
import 'package:car_rental_admin/screen/sign_in_screen/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController{
  int index = 0;
  final auth = FirebaseAuth.instance;

  void setIndex(int value){
    index = value;
    update(["bottom"]);
  }

  void notification(){
    Get.to(const NotificationScreen());
  }

  void signInScreen() {
    Get.to(() => const SignInScreen());
  }

}