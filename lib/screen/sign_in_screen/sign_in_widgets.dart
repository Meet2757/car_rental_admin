import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/widgets/common_button.dart';
import 'package:car_rental_admin/common/widgets/common_textField.dart';
import 'package:car_rental_admin/screen/Home_Page/home_screen.dart';
import 'package:car_rental_admin/screen/dashboard/dashboard_screen.dart';
import 'package:car_rental_admin/screen/sign_in_screen/sign_in_controller.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget title = Padding(
  padding: EdgeInsets.only(right: Get.width * 0.48),
  child: Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: label(
          text: StringRes.sign,
          fontFamily: AssetRes.imprimaRegular,
          size: 48,
          color: ColorRes.darkSlateGray,
          textAlign: TextAlign.start,
        ),
      ),
      label(
        text: StringRes.sin,
        fontFamily: AssetRes.imprimaRegular,
        size: 48,
        textAlign: TextAlign.start,
      ),
    ],
  ),
);

Widget phone = GetBuilder<SignInScreenController>(
  builder: (controller) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: Get.height * 0.05),
      child: Row(
        children: [
          Expanded(
            child: commonTextField(
              controller.phoneController,
              controller.phoneFocusNode,
              hintText: StringRes.phone,
              prefix: const Icon(
                Icons.phone,
                color: ColorRes.gray63,
              ),
              textInputType: TextInputType.phone,
              maxLength: 10,
            ),
          ),
        ],
      ),
    );
  },
);

Widget password = GetBuilder<SignInScreenController>(
  builder: (controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: commonTextField(
                controller.passwordController,
                controller.passwordFocusNode,
                hintText: StringRes.password,
                prefix: const Icon(
                  Icons.key,
                  color: ColorRes.gray63,
                ),
                maxLength: 6,
              )),
        ],
      ),
    );
  },
);
Widget forgot = GetBuilder<SignInScreenController>(builder: (controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: EdgeInsets.only(right: Get.width * 0.06),
        child: const Text(
          StringRes.forget,
          style: TextStyle(
              fontSize: 14,
              fontFamily: AssetRes.poppins,
              color: ColorRes.black),
        ),
      )
    ],
  );
});

Widget loginbutton = GetBuilder<SignInScreenController>(builder: (controller) {
  return InkWell(
    onTap: () {
      Get.to(const DashboardScreen());
    },
    child: commonDoneButton(
      StringRes.login,
    ),
  );
});

Widget account = GetBuilder<SignInScreenController>(builder: (controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text(
        StringRes.account,
        style: TextStyle(
            fontSize: 16, fontFamily: AssetRes.poppins, color: ColorRes.black),
      ),
      InkWell(
        child: Text(
          StringRes.signup,
          style: TextStyle(
              fontSize: 16,
              fontFamily: AssetRes.poppins,
              color: ColorRes.darkSlateGray),
        ),
      ),
    ],
  );
});
