import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/widgets/common_appbar.dart';
import 'package:car_rental_admin/screen/Home_Page/home_screen.dart';
import 'package:car_rental_admin/screen/Order_List_Page/order_list_screen.dart';
import 'package:car_rental_admin/screen/Profile_page/profile_screen.dart';
import 'package:car_rental_admin/screen/dashboard/dashboard_controller.dart';
import 'package:car_rental_admin/screen/dashboard/dashboard_widget.dart';
import 'package:car_rental_admin/service/pref_service.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../notification_page/notification_screen.dart';


class HomepageDrawer extends StatefulWidget {
  const HomepageDrawer({Key? key}) : super(key: key);

  @override
  State<HomepageDrawer> createState() => _HomepageDrawerState();
}

class _HomepageDrawerState extends State<HomepageDrawer> {
  @override
  Widget build(BuildContext context) {
    return const ZoomDrawer(
      menuScreen: DrawerScreen(),
      mainScreen: DashboardScreen(),
      borderRadius: 30,
      showShadow: true,
      angle: 0.0,
      menuBackgroundColor: ColorRes.darkSlateGray,
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              ZoomDrawer.of(context)?.toggle();
            },
            child: Image.asset(
              AssetRes.sidebar,
              height: 15,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              const DrawerHeader(
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AssetRes.user),
                      maxRadius: 40,
                      foregroundColor: ColorRes.white,
                    ),
                  )),
              ListTile(
                leading: Image.asset(AssetRes.myProfile,
                    height: 20, color: ColorRes.white),
                title: label(
                    text: StringRes.myProfile, size: 13, color: ColorRes.white),
                onTap: () {
                  Get.to(const ProfileScreen());
                },
              ),
              const Divider(thickness: 2),
              ListTile(
                leading: Image.asset(AssetRes.notificationAppbar,
                    height: 24, color: ColorRes.white),
                title: label(
                    text: StringRes.notification,
                    size: 13,
                    color: ColorRes.white),
                onTap: () {
                  Get.to(const NotificationScreen());
                },
              ),
              const Divider(thickness: 2),
              ListTile(
                leading: Image.asset(AssetRes.logOut,
                    height: 24, color: ColorRes.white),
                title: label(
                    text: StringRes.logOut, size: 13, color: ColorRes.white),
                onTap: () {
                  PrefServices.prefClear();
                  controller.auth
                      .signOut()
                      .then((value) => controller.signInScreen());
                },
              ),
            ],
          ),
        ),
        backgroundColor: ColorRes.darkSlateGray,
      );
    });
  }
}

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
                label(text: StringRes.admin, size: 12.0, color: ColorRes.white),
                label(text: StringRes.carRental, size: 10.0, color: ColorRes.white),
              ],
            ),
            leading: InkWell(
              onTap: () {
                ZoomDrawer.of(context)?.toggle();
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
                      width: Get.width * 0.060,
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
