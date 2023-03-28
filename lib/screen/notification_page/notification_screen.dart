import 'package:car_rental_admin/common/space_and_dividers.dart';
import 'package:car_rental_admin/screen/notification_page/notification_controller.dart';
import 'package:car_rental_admin/screen/notification_page/notofication_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            verticalSpace(Get.height * 0.04),
            notificationAppBar,
            verticalSpace(Get.height*0.20),
            logo,
            verticalSpace(Get.height * 0.07),
            refresh,
          ],
        ),
      ),
    );
  }
}
