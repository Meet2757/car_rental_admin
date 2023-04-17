import 'package:car_rental_admin/screen/Home_Page/home_screen.dart';
import 'package:car_rental_admin/screen/dashboard/dashboard_screen.dart';
import 'package:car_rental_admin/screen/sign_up_page/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreenController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DatabaseReference database =
      FirebaseDatabase.instance.ref('Admin').child('Login');

  Map adminData ={};
  // List<Map> user =[];
  // String? errorEmail;
  // String? errorPassword;

  @override
  void onInit() {
    // TODO: implement onInit

    getData();

    super.onInit();
  }

  void homePageDrawer() {
    Get.to(const HomepageDrawer());
  }

  void singUpScreen() {
    Get.to(const SignUpScreen());
  }


  Future<void> getData() async {
    await database.once().then((value) {
      Map temp = value.snapshot.value as Map;
      //print(temp['Email']);
      adminData.addAll(temp);
      //print(adminData);

    });
  }
}
