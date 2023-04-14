import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget backButton() => InkWell(
  onTap: () {
    Get.back();
  },
  child: Container(
    height: Get.height * 0.050,
    width: Get.height,
    decoration: BoxDecoration(
      color: ColorRes.darkSlateGray,
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Icon(
      Icons.arrow_back_ios_new_rounded,
      color: ColorRes.white,
    ),
  ),
);


Widget commonEditButton() => Container(
  height: Get.height * 0.04,
  width: Get.height,
  decoration: BoxDecoration(
    color: ColorRes.darkSlateGray,
    borderRadius: BorderRadius.circular(10),
  ),
  child: const Icon(
    Icons.edit,
    color: ColorRes.white,
  ),
);

Widget commonDeleteButton() => Container(
  height: Get.height * 0.04,
  width: Get.height,
  decoration: BoxDecoration(
    color: ColorRes.darkSlateGray,
    borderRadius: BorderRadius.circular(10),
  ),
  child: const Icon(
    Icons.delete,
    color: ColorRes.white,
  ),
);

Widget whiteBackButton() => InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: Get.height * 0.050,
        width: Get.width * 0.050,
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: ColorRes.darkSlateGray,
        ),
      ),
    );

Widget commonDoneButton(String title) => Container(
      height: Get.height * 0.070,
      width: Get.width * 0.900,
      decoration: BoxDecoration(
        color: ColorRes.darkSlateGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: label(
            text: title,
            textAlign: TextAlign.center,
            fontFamily: AssetRes.poppinsSemiBold,
            color: ColorRes.white,
            size: 20),
      ),
    );

Widget commonPriceButton(String price) => Container(
  height: Get.height * 0.05,
  padding: const EdgeInsets.all(10),
  decoration: const BoxDecoration(
   color: ColorRes.darkSlateGray,
    borderRadius:
    BorderRadius.all(Radius.circular(15)),
    boxShadow: [
      BoxShadow(
        color: ColorRes.gray63,
        blurRadius: 2,
        spreadRadius: 1,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Center(
    child: label(
        text: '${StringRes.rupees} $price/day',
        textAlign: TextAlign.center,
        fontFamily: AssetRes.poppinsBold,
        color: ColorRes.white,
        size: 12),
  ),
);

Widget commonTrackButton(String title) => InkWell(
  onTap: () {},
  child: Container(
    height: Get.height * 0.070,
    width: Get.width * 0.900,
    decoration: BoxDecoration(
      color: ColorRes.white,
      border: Border.all(color: ColorRes.darkSlateGray,width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: label(
          text: title,
          textAlign: TextAlign.center,
          fontFamily: AssetRes.poppinsSemiBold,
          color: ColorRes.darkSlateGray,
          size: 20),
    ),
  ),
);

Widget commonAcceptButton(String title) => Container(
  height: Get.height * 0.050,
  width: Get.width * 0.320,
  decoration: BoxDecoration(
    color: ColorRes.darkSlateGray,
    borderRadius: BorderRadius.circular(15),
  ),
  child: Center(
    child: label(
        text: title,
        textAlign: TextAlign.center,
        fontFamily: AssetRes.poppinsSemiBold,
        color: ColorRes.white,
        size: 20),
  ),
);

Widget commonCloseIconButton()=> IconButton(
    onPressed: () {

    },
    icon: const Icon(
      Icons.clear_rounded,
      color: ColorRes.darkSlateGray,
      size: 20,
    ));
