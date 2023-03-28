import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget label({
  required String text,
  Color color = ColorRes.black,
  double size = 18,
  TextAlign textAlign = TextAlign.center,
  FontWeight fontWeight = FontWeight.normal,
  String fontFamily = AssetRes.poppinsSemiBold,
  TextDecoration decoration = TextDecoration.none,
}) =>
    Text(
      text,
      style: defaultTextStyle(
        color: color,
        size: size,
        fontFamily: fontFamily,
        decoration: decoration,
      ),
      textAlign: textAlign,
    );

TextStyle defaultTextStyle({
  Color color = ColorRes.black,
  double size = 18,
  String? fontFamily,
  TextDecoration decoration = TextDecoration.none,
}) =>
    TextStyle(
      color: color,
      fontSize: size,
      decoration: decoration,
      fontFamily: fontFamily!,
    );

Widget line = Padding(
  padding: EdgeInsets.only(right: Get.width * 0.68, top: Get.height * 0.00015),
  child: Container(
    height: Get.height * 0.005,
    width: Get.width * 0.17,
    decoration: const BoxDecoration(
        color: ColorRes.darkSlateGray,
        borderRadius: BorderRadius.all(Radius.circular(15))),
  ),
);
