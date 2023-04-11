import 'package:car_rental_admin/common/space_and_dividers.dart';
import 'package:car_rental_admin/common/widgets/common_button.dart';
import 'package:car_rental_admin/screen/Profile_page/profile_controller.dart';
import 'package:car_rental_admin/screen/dashboard/dashboard_screen.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: Get.height * 0.35,
              width: Get.width,
              decoration: const BoxDecoration(
                color: ColorRes.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      horizontalSpace(Get.width * 0.03),
                      verticalSpace(Get.height * 0.05),
                      SizedBox(
                        width: Get.height * 0.050,
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(const DashboardScreen());
                            },
                            child: whiteBackButton()),
                      ),
                    ],
                  ),
                  imageShow
                ],
              ),
            ),
            verticalSpace(Get.height * 0.03),
            profile,
            verticalSpace(Get.height * 0.05),
          ],
        ),
      ),
    );
  }
}
