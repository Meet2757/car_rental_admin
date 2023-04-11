import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/space_and_dividers.dart';
import 'package:car_rental_admin/common/widgets/common_button.dart';
import 'package:car_rental_admin/screen/sign_in_screen/sign_in_controller.dart';
import 'package:car_rental_admin/service/pref_service.dart';
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

Widget phone(BuildContext context) => GetBuilder<SignInScreenController>(
      builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.email,
                    onTap: () {
                      controller.password;
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
                      hintText: 'Enter Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter a Email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.password,
                    onTap: () {
                      controller.password;
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
                verticalSpace(Get.height * 0.02),
                Row(
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
                    ),
                  ],
                ),
                verticalSpace(Get.height * 0.07),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        if (controller.email.text ==
                                controller.adminData['Email'] &&
                            controller.password.text ==
                                controller.adminData['Password']) {
                          print('true');
                          controller.homePageDrawer();
                          PrefServices.addData('IsLogin', 'isLogin');
                          PrefServices.addData('userEmail', controller.adminData['Email']);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Your ID or Password was Wrong'),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red,
                            ),
                          );
                          controller.password.text = '';
                          controller.email.text = '';
                        }
                      } else {
                        controller.formKey.currentState!.validate();
                      }
                    },
                    child: Container(
                      child: commonDoneButton(StringRes.login),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

Widget account(BuildContext context) =>
    GetBuilder<SignInScreenController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            StringRes.account,
            style: TextStyle(
                fontSize: 16,
                fontFamily: AssetRes.poppins,
                color: ColorRes.black),
          ),
          InkWell(
            onTap: () {
              //controller.singUpScreen();
            },
            child: const Text(
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
