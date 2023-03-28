import 'package:car_rental_admin/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget horizontalSpace(double width) => SizedBox(width: width);

Widget verticalSpace(double height) => SizedBox(height: height);

Widget divider = Padding(
  padding:  EdgeInsets.only(left: Get.width*0.050,right: Get.width*0.050 ),
  child: Container(
    height: 2,
    color: ColorRes.paleAqua,
  ),
);