import 'package:car_rental_admin/common/space_and_dividers.dart';
import 'package:car_rental_admin/screen/Add_Car_Page/add_car_screen.dart';
import 'package:car_rental_admin/screen/Home_Page/home_screen_controller.dart';
import 'package:car_rental_admin/screen/Home_Page/home_screen_widgets.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            carList,
          ],
        ),
      ),
      floatingActionButton: GetBuilder<HomeScreenController>(builder: (controller) {
        return Container(
          child: addNewCar,
        );
      },),
    );
  }
}
