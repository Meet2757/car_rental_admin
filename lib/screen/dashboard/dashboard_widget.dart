import 'package:car_rental_admin/screen/dashboard/dashboard_controller.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget homeFooter = GetBuilder<DashboardController>(
    id: "bottom",
    builder: (controller) {
      return Container(
        height: 73,
        decoration: const BoxDecoration(
          color: ColorRes.darkSlateGray,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: () => controller.setIndex(0),
                  child: Image.asset(
                    controller.index != 0 ? AssetRes.home : AssetRes.selectHome,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
            const VerticalDivider(
              thickness: 2,
              color: ColorRes.white,
              width: 25,
              endIndent: 10,
              indent: 10,
            ),
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: () => controller.setIndex(1),
                  child: Image.asset(
                    controller.index != 1 ? AssetRes.list : AssetRes.selectList,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
