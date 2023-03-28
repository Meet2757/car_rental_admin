import 'package:car_rental_admin/common/space_and_dividers.dart';
import 'package:car_rental_admin/screen/Order_List_Page/order_list_screen_controller.dart';
import 'package:car_rental_admin/screen/Order_List_Page/order_list_screen_widgets.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderListController());
    return Scaffold(
      backgroundColor: ColorRes.homeBackGround,
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(Get.height * 0.02),
            orderList,
          ],
        ),
      ),
    );
  }
}
