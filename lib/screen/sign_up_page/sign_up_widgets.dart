import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/space_and_dividers.dart';
import 'package:car_rental_admin/common/widgets/common_button.dart';
import 'package:car_rental_admin/common/widgets/common_textField.dart';
import 'package:car_rental_admin/screen/Home_Page/home_screen.dart';
import 'package:car_rental_admin/screen/sign_up_page/sign_up_controller.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget title1 = Padding(
  padding: EdgeInsets.only(right: Get.width * 0.3),
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
        text: StringRes.sup,
        fontFamily: AssetRes.imprimaRegular,
        size: 48,
        textAlign: TextAlign.start,
      ),
    ],
  ),
);

Widget firstname = GetBuilder<SignUpScreenController>(
  builder: (controller) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * 0.08,
                child: TextFormField(
                  controller: controller.firstNameController,
                  onTap: () {
                    controller.firstNameController;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: label(
                                text: StringRes.first,
                                size: 14,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                          WidgetSpan(
                            child: label(
                                text: StringRes.star,
                                size: 14,
                                color: ColorRes.mahogany,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter First Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a First Name';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * 0.08,
                child: TextFormField(
                  controller: controller.lastNameController,
                  onTap: () {
                    controller.lastNameController;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: label(
                                text: StringRes.last,
                                size: 14,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                          WidgetSpan(
                            child: label(
                                text: StringRes.star,
                                size: 14,
                                color: ColorRes.mahogany,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter Last Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Last Name';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * 0.10,
                child: TextFormField(
                  controller: controller.phoneController,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  onTap: () {
                    controller.phoneController;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: label(
                                text: StringRes.phone,
                                size: 14,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                          WidgetSpan(
                            child: label(
                                text: StringRes.star,
                                size: 14,
                                color: ColorRes.mahogany,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter Phone Number',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Phone Number';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * 0.08,
                child: TextFormField(
                  controller: controller.emailController,
                  onTap: () {
                    controller.emailController;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: label(
                                text: StringRes.email,
                                size: 14,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                          WidgetSpan(
                            child: label(
                                text: StringRes.star,
                                size: 14,
                                color: ColorRes.mahogany,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter Email ID',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Email ID';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * 0.08,
                child: TextFormField(
                  controller: controller.passwordController,
                  onTap: () {
                    controller.passwordController;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: label(
                                text: StringRes.password,
                                size: 14,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                          WidgetSpan(
                            child: label(
                                text: StringRes.star,
                                size: 14,
                                color: ColorRes.mahogany,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Password';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * 0.08,
                child: TextFormField(
                  controller: controller.conformPasswordController,
                  onTap: () {
                    controller.conformPasswordController;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: label(
                                text: StringRes.confirmPassword,
                                size: 14,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                          WidgetSpan(
                            child: label(
                                text: StringRes.star,
                                size: 14,
                                color: ColorRes.mahogany,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter Confirm Password ',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Confirm Password';
                    }
                    return null;
                  },
                ),
              ),
            ),
            verticalSpace(Get.height * 0.04),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.loginData();
                    controller.signupButton();
                  } else {
                    controller.formKey.currentState!.validate();
                  }
                },
                child: commonDoneButton(
                  StringRes.signup,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
);
