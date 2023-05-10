import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/widgets/common_appbar.dart';
import 'package:car_rental_admin/common/widgets/common_button.dart';
import 'package:car_rental_admin/screen/Order_History_page/order_history_controller.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  id: "orderHistory",
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: controller. orderListHistoryShow['UserImage'],width: 100,fit: BoxFit.fitHeight,
                  placeholder: (context, url) => SizedBox(
                      height: Get.height * 0.04,
                      width: Get.width * 0.02,
                      child: const Center(child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: Text(
                  "Name : " + controller.orderListHistoryShow['UserName'],
                  style: const TextStyle(
                      fontSize: 11, fontFamily: AssetRes.poppinsRegular),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  "Phone No : " + controller.orderListHistoryShow['Phone'],
                  style: const TextStyle(
                      fontSize: 11, fontFamily: AssetRes.poppinsRegular),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  "Birth Date : " + controller.orderListHistoryShow['Birth_Date'],
                  style: const TextStyle(
                      fontSize: 11, fontFamily: AssetRes.poppinsRegular),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  "Gender : " + controller.orderListHistoryShow['Gender'],
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
  id: "orderHistory",
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
          child: label(text: 'To : ${DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.orderListHistoryShow['toDate'],))} From:  ${DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.orderListHistoryShow['fromDate'],))}' ,
          ),
        ),
      ),
    );
  },
);

Widget bookingCar = GetBuilder<OrderHistoryController>(
  id: "orderHistory",
  builder: (controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        width: Get.width,
        height: Get.height*0.2,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: ColorRes.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child:CachedNetworkImage(
          imageUrl: controller.orderListHistoryShow['CarImage'],width: 168,
          placeholder: (context, url) => SizedBox(
              height: Get.height * 0.10,
              width: Get.width * 0.10,
              child: const Center(child: CircularProgressIndicator())),
          errorWidget: (context, url, error) => const Icon(Icons.error),
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
  id: "orderHistory",
  builder: (controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Center(
        child: Text(
          controller.orderListHistoryShow['Description'],
          style: const TextStyle(
              fontSize: 11, fontFamily: AssetRes.poppinsRegular),
        ),
      ),
    );
  },
);

Widget userDocument = GetBuilder<OrderHistoryController>(
  id: "orderHistory",
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
                  child: CachedNetworkImage(
                    imageUrl: controller.orderListHistoryShow['aadhaar'],width: 168,
                    placeholder: (context, url) => SizedBox(
                        height: Get.height * 0.10,
                        width: Get.width * 0.10,
                        child: const Center(child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
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
                  child: CachedNetworkImage(
                    imageUrl: controller.orderListHistoryShow['licence'],width: 168,
                    placeholder: (context, url) => SizedBox(
                        height: Get.height * 0.10,
                        width: Get.width * 0.10,
                        child: const Center(child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
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
                  child: CachedNetworkImage(
                    imageUrl: controller.orderListHistoryShow['photo'],width: 168,
                    placeholder: (context, url) => SizedBox(
                        height: Get.height * 0.10,
                        width: Get.width * 0.10,
                        child: const Center(child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
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
