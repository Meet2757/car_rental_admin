import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/widgets/common_appbar.dart';
import 'package:car_rental_admin/common/widgets/common_button.dart';
import 'package:car_rental_admin/screen/notification_page/notification_controller.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/asset_res.dart';

Widget notificationAppBar = GetBuilder<NotificationController>(
  builder: (controller) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.010),
      child: commonAppBar(
        start: InkWell(
            onTap: () {
              controller.backButton();
            },
            child: backButton()),
        text: StringRes.notification,
        end: AssetRes.notificationPageAppbar,
      ),
    );
  },
);

Widget logo = GetBuilder<NotificationController>(
  builder: (controller) {
    return Center(
      child: Image.asset(
        AssetRes.logoNotification,
        height: Get.height * 0.25,
      ),
    );
  },
);

Widget refresh = GetBuilder<NotificationController>(
  builder: (controller) {
    return DottedBorder(
        color: ColorRes.gray63,
        strokeWidth: 3,
        borderType: BorderType.RRect,
        radius: const Radius.circular(30),
        dashPattern: const [7, 6],
        child: SizedBox(
          height: Get.height * 0.050,
          width: Get.width * 0.35,
          child: Center(
            child: label(
                text: StringRes.refresh,
                textAlign: TextAlign.center,
                size: 18,
                fontFamily: AssetRes.poppinsBold,
                color: ColorRes.darkSlateGray),
          ),
        ));
  },
);
