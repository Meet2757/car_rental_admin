import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget commonTextField(
  TextEditingController txtController,
  FocusNode focusNode, {
  String? hintText,
  TextInputType? textInputType,
  int? maxLength,
  String? fontFamily,
  TextCapitalization? textCapitalization,
  bool enable = true,
  Widget? prefix,
  Widget? suffixIcon,
}) =>
    Container(
      height: Get.height * 0.07,
      decoration: const BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: ColorRes.gray63,
            blurRadius: 1,
            spreadRadius: 0.5,
            offset: Offset(
              0.0,
              2.0,
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 5),
        child: TextField(
          focusNode: focusNode,
          controller: txtController,
          keyboardType: textInputType,
          maxLength: maxLength,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          enabled: enable,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
            hintText: hintText ?? "",
            prefixIcon: prefix,
            suffix: suffixIcon,
            filled: false,
            hintStyle: TextStyle(
                fontSize: 14, fontFamily: fontFamily ?? AssetRes.poppins),
          ),
        ),
      ),
    );

Widget commonTextFieldProfile(TextEditingController textController,
        FocusNode focusNode, Color color, TextInputType? textInputType) =>
    Row();