import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/widgets/common_appbar.dart';
import 'package:car_rental_admin/screen/Home_Page/home_screen.dart';
import 'package:car_rental_admin/screen/Order_List_Page/order_list_screen.dart';
import 'package:car_rental_admin/screen/dashboard/dashboard_controller.dart';
import 'package:car_rental_admin/screen/dashboard/dashboard_widget.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorRes.darkSlateGray,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label(text: StringRes.admin, size: 16.0, color: ColorRes.white),
                label(text: StringRes.carRental, size: 14.0, color: ColorRes.white),
              ],
            ),
            leading: InkWell(
              onTap: () {

              },
              child: Padding(
                  padding: const EdgeInsets.all(5.0), child: commonAdminProfile()),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: InkWell(
                    onTap: () {
                      controller.notification();
                    },
                    child: Image.asset(
                      AssetRes.notificationAppbar,
                      color: ColorRes.white,
                      width: Get.width * 0.080,
                    )),
              )
            ],
          ),
          backgroundColor: ColorRes.homeBackGround,
          body: GetBuilder<DashboardController>(
            id: "bottom",
            builder: (controller) {
              if (controller.index == 0) {
                return const HomeScreen();
              } else {
                return controller.index == 1 ? const OrderListScreen() : const SizedBox();
              }
            },
          ),
          bottomNavigationBar: homeFooter,
        );
      }
    );
  }
}
