import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:flutter/material.dart';

Widget commonAppBar({Widget? start, String? text, String? end}) => Row(
      children: [
        Expanded(
          flex: 2,
          child: start ?? const SizedBox(),
        ),
        Expanded(
          flex: 11,
          child: label(
            text: text ?? "",
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {},
            child: Image(
              image: AssetImage(end ?? ""),
              height: 30,
              width: 30,
            ),
          ),
        ),
      ],
    );

Widget commonAdminProfile() => Stack(
  alignment: Alignment.bottomCenter,
  children: [
    Center(
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          border: Border.all(color: ColorRes.white, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            AssetRes.user,
            fit: BoxFit.fill,
            color: ColorRes.white,
          ),
        ),
      ),
    ),
  ],
);
