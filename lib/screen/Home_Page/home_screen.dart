import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/space_and_dividers.dart';
import 'package:car_rental_admin/common/widgets/common_appbar.dart';
import 'package:car_rental_admin/screen/Home_Page/home_screen_controller.dart';
import 'package:car_rental_admin/screen/Home_Page/home_screen_widgets.dart';
import 'package:car_rental_admin/screen/dashboard/dashboard_screen.dart';
import 'package:car_rental_admin/screen/notification_page/notification_screen.dart';
import 'package:car_rental_admin/screen/sign_in_screen/sign_in_screen.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';


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
              child:commonAdminProfile(),
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

              },
            ),
            const Divider(thickness: 2),
            ListTile(
              leading: Image.asset(
                AssetRes.myDocument,
                height: 24,
                color: ColorRes.white,
              ),
              title: label(
                  text: StringRes.myDocument, size: 13, color: ColorRes.white),
              onTap: () {
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
                Get.to(const SignInScreen());
              },
            ),
          ],
        ),
      ),
      backgroundColor: ColorRes.darkSlateGray,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return Scaffold(
      backgroundColor: ColorRes.homeBackGround,
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(Get.height * 0.02),
            carList
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: label(text: StringRes.addCar, color: ColorRes.white),
        backgroundColor: ColorRes.darkSlateGray,
        icon: const Icon(Icons.add),
        tooltip: StringRes.addCar,
      ),
    );
  }
}
