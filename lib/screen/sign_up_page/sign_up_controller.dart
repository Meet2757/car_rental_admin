import 'package:car_rental_admin/screen/Home_Page/home_screen.dart';
import 'package:car_rental_admin/screen/sign_up_page/sign_up_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController conformPasswordController =TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  var phone = "";
  var password = "";
  String updateKey = "";
  FirebaseDatabase database = FirebaseDatabase.instance;
  final formKey = GlobalKey<FormState>();

  String? validatePhone(String value) {
    if (value.length <= 10) {
      return "Please Enter Your Valid Number";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length <= 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  void signupButton() {
    Get.to(() => const SignUpScreen());
  }


  void loginData(){
    String? key = database.ref("Admin").child("SignUp").push().key;
    print(key);
    updateKey = key!;
    database.ref("Admin").child("SignUp").child(key).set({
    "First Name": firstNameController.text,
    "ast Name": lastNameController.text,
    "Phone": phoneController.text,
    "Email": emailController.text,
    "Password": passwordController.text,
    "Conform Password": conformPasswordController.text,
  });
  }
}
