import 'package:car_rental_admin/common/space_and_dividers.dart';
import 'package:car_rental_admin/screen/Order_History_page/order_history_controller.dart';
import 'package:car_rental_admin/screen/Order_History_page/order_history_widget.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderHistoryController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.homeBackGround,
        body: GetBuilder<OrderHistoryController>(
          id: "orderHistory",
          builder: (controller) {
            return controller.isLoading?const Center(child: CircularProgressIndicator(),):Column(
              children: [
                orderListAppBar,
                verticalSpace(Get.height* 0.02),
                userName,
                verticalSpace(Get.height* 0.02),
                bookingDate,
                verticalSpace(Get.height* 0.02),
                bookingCar,
                verticalSpace(Get.height* 0.02),
                description,
                verticalSpace(Get.height* 0.02),
                carDescription,
                verticalSpace(Get.height* 0.02),
                userDocument,
                verticalSpace(Get.height* 0.02),
              ],
            );
          }
        ),
      ),
    );
  }
}

