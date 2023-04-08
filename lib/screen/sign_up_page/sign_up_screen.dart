import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/space_and_dividers.dart';
import 'package:car_rental_admin/screen/sign_up_page/sign_up_controller.dart';
import 'package:car_rental_admin/screen/sign_up_page/sign_up_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                verticalSpace(Get.height * 0.01),
                title1,
                verticalSpace(Get.height * 0.02),
                line,
                verticalSpace(Get.height * 0.08),
                firstname,
                verticalSpace(Get.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
