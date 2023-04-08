import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/space_and_dividers.dart';
import 'package:car_rental_admin/screen/sign_in_screen/sign_in_controller.dart';
import 'package:car_rental_admin/screen/sign_in_screen/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignInScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              verticalSpace(Get.height * 0.1),
              title,
              verticalSpace(Get.height * 0.02),
              line,
              verticalSpace(Get.height * 0.04),
              phone(context),
              verticalSpace(Get.height * 0.04),
              account(context),
              verticalSpace(Get.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
