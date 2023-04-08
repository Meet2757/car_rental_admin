import 'dart:io';

import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/widgets/common_button.dart';
import 'package:car_rental_admin/screen/Profile_page/profile_controller.dart';
import 'package:car_rental_admin/screen/sign_in_screen/sign_in_screen.dart';
import 'package:car_rental_admin/service/pref_service.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget imageShow = GetBuilder<ProfileController>(
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
                      child: controller.image == null
                          ? const Image(
                                          image: NetworkImage(
                                              'https://in.images.search.yahoo.com/search/images?p=person+image+icon&fr=mcafee&type=E211IN826G91735&imgurl=http%3A%2F%2Fcdn.onlinewebfonts.com%2Fsvg%2Fimg_166744.png#id=10&iurl=https%3A%2F%2Fwww.clipartmax.com%2Fpng%2Fmiddle%2F47-470043_icons8-flat-businessman-person-icon-png.png&action=click'))
                                      .toString() ==
                                  ""
                              ? const Icon(
                                  Icons.person_outlined,
                                  size: 35,
                                )
                              : Image(
                                  image: const NetworkImage(
                                      'https://in.images.search.yahoo.com/search/images?p=person+image+icon&fr=mcafee&type=E211IN826G91735&imgurl=http%3A%2F%2Fcdn.onlinewebfonts.com%2Fsvg%2Fimg_166744.png#id=10&iurl=https%3A%2F%2Fwww.clipartmax.com%2Fpng%2Fmiddle%2F47-470043_icons8-flat-businessman-person-icon-png.png&action=click'),
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.error_outline,
                                      color: ColorRes.mahogany,
                                    );
                                  },
                                )
                          : Image.file(File(controller.image!.path).absolute),
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
builder: (controller) {
  return Form(child: Padding(
    padding: const EdgeInsets.only(left: 10.0,right: 10.0),
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
              onTap: () {
                controller.lastName;
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
            height: Get.height * 0.08,
            child: TextFormField(
              controller: controller.phone,
              onTap: () {
                controller.phone;
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
              controller: controller.email,
              onTap: () {
                controller.email;
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
                  return 'Please Enter a Email ID';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    ),
  ),);
},
);

Widget saveButton(BuildContext context) => GetBuilder<ProfileController>(
      builder: (controller) {
        return Expanded(
          child: InkWell(
            onTap: () {

              },
            child: commonDoneButton(StringRes.saveButton),
          ),
        );
      },
    );
