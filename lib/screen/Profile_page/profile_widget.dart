import 'dart:io';

import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/widgets/common_button.dart';
import 'package:car_rental_admin/screen/Profile_page/profile_controller.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget imageShow = GetBuilder<ProfileController>(
  id: 'profileDetails',
  builder: (controller) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 40,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: controller.imageProfile == null ?
                      const Center(
                        child: Icon(
                          Icons.person,size: 145,color: ColorRes.white,
                        ),
                      ):Image.network(controller.imageProfile!),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.pickImage(context);
                },
                child: const CircleAvatar(
                  radius: 14,
                  backgroundColor: ColorRes.white,
                  child: Icon(
                    Icons.add,
                    size: 18,
                    color: ColorRes.black,
                  ),
                ),
              )
            ],
          ),
        ],
      );
    });
  },
);

Widget profile = GetBuilder<ProfileController>(
  id: 'profileDetails',
  builder: (controller) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: Get.height * 0.08,
                    child: TextFormField(
                      controller: controller.firstName,
                      onTap: () {
                        controller.firstName;
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
                      controller: controller.lastName,

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
                    height: Get.height * 0.1,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      controller: controller.phone,

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
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.email,

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
                          return 'Please Enter a Email ID';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: InkWell(
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.profileData();
                      } else {
                        controller.formKey.currentState!.validate();
                      }
                    },
                    child: commonDoneButton(StringRes.saveButton),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  },
);
