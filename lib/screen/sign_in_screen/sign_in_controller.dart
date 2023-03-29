import 'package:car_rental_admin/screen/Home_Page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreenController extends GetxController {
  late TextEditingController phoneController, passwordController;
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

    @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  void onClosed() {
    phoneController.dispose();
    passwordController.dispose();
  }

  void homePageDrawer(){
      Get.to(HomepageDrawer());
  }

}
