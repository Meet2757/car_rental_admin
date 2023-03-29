import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/widgets/common_appbar.dart';
import 'package:car_rental_admin/common/widgets/common_button.dart';
import 'package:car_rental_admin/screen/Order_History_page/order_history_controller.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget orderListAppBar = GetBuilder<OrderHistoryController>(
  builder: (controller) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.010),
      child: commonAppBar(
        start: InkWell(
            onTap: () {
              controller.backListScreen();
            },
            child: backButton()),
        text: StringRes.orderHistory,
        end: AssetRes.notificationAppbar,
      ),
    );
  },
);

Widget userName = GetBuilder<OrderHistoryController>(
  builder: (controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: ColorRes.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Image.asset(
                controller.orderListHistoryShow['userImage'],
                color: ColorRes.black,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: Text(
                  "Name : " + controller.orderListHistoryShow['name'],
                  style: const TextStyle(
                      fontSize: 11, fontFamily: AssetRes.poppinsRegular),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  "Email : " + controller.orderListHistoryShow['email'],
                  style: const TextStyle(
                      fontSize: 11, fontFamily: AssetRes.poppinsRegular),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  "Phone No : " + controller.orderListHistoryShow['phone_no'],
                  style: const TextStyle(
                      fontSize: 11, fontFamily: AssetRes.poppinsRegular),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  "Birth Date : " + controller.orderListHistoryShow['birthday'],
                  style: const TextStyle(
                      fontSize: 11, fontFamily: AssetRes.poppinsRegular),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  "Gender : " + controller.orderListHistoryShow['gender'],
                  style: const TextStyle(
                      fontSize: 11, fontFamily: AssetRes.poppinsRegular),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  },
);

Widget bookingDate = GetBuilder<OrderHistoryController>(
  builder: (controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        height: 35,
        width: Get.width,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: ColorRes.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Booking Date : " + controller.orderListHistoryShow['date'],
            style: const TextStyle(
                fontSize: 11, fontFamily: AssetRes.poppinsRegular),
          ),
        ),
      ),
    );
  },
);

Widget bookingCar = GetBuilder<OrderHistoryController>(
  builder: (controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: ColorRes.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Image.asset(
            controller.orderListHistoryShow['image'],
            width: 168,
          ),
        ),
      ),
    );
  },
);

Widget description = GetBuilder<OrderHistoryController>(
  builder: (controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          label(
              text: StringRes.carDescription,
              size: 15,
              fontFamily: AssetRes.poppinsSemiBold),
        ],
      ),
    );
  },
);

Widget carDescription = GetBuilder<OrderHistoryController>(
  builder: (controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Center(
        child: Text(
          controller.orderListHistoryShow['description'],
          style: const TextStyle(
              fontSize: 11, fontFamily: AssetRes.poppinsRegular),
        ),
      ),
    );
  },
);

Widget userDocument = GetBuilder<OrderHistoryController>(
  builder: (controller) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Container(
                height: Get.height * 0.18,
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: ColorRes.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    controller.orderListHistoryShow['aadhaar'],
                    width: 168,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Container(
                height: Get.height * 0.18,
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: ColorRes.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    controller.orderListHistoryShow['license'],
                    width: 168,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: Container(
                height: Get.height * 0.18,
                width: Get.width * 0.7,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: ColorRes.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    controller.orderListHistoryShow['photo'],
                    width: 168,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
);
