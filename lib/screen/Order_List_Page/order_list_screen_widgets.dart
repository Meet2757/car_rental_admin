import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental_admin/screen/Order_List_Page/order_list_screen_controller.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Widget orderList = GetBuilder<OrderListController>(
    id:"order",
    builder: (controller) {
  return Expanded(
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: controller.orderListShow.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 5.0, bottom: 20.0),
        child: InkWell(
          onTap: () => controller.carOrderDetails(controller.orderListShow[index]["key"]),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 115,
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                decoration: const BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorRes.gray63,
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(
                        0,
                        2,
                      ),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            imageUrl: controller.orderListShow[index]['userImage'],height: Get.height*0.140,fit: BoxFit.fitHeight,
                            placeholder: (context, url) => SizedBox(
                                height: Get.height * 0.02,
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
                            controller.orderListShow[index]['title'],
                            style: const TextStyle(
                                fontSize: 11, fontFamily: AssetRes.poppinsRegular),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                          child: Text('To : ${DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.orderListShow[index]['toDate'],))}',
                            style: const TextStyle(
                                fontSize: 11, fontFamily: AssetRes.poppinsRegular),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                          child: Text('Form : ${DateFormat("dd/MM/yyyy").format(DateTime.parse(controller.orderListShow[index]['fromDate'],))}',
                            style: const TextStyle(
                                fontSize: 11, fontFamily: AssetRes.poppinsRegular),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                          child: Text(
                            controller.orderListShow[index]['price'],
                            style: const TextStyle(
                                fontSize: 11, fontFamily: AssetRes.poppinsRegular),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                child: CachedNetworkImage(
                  imageUrl: controller.orderListShow[index]['image'],width: 161,
                  placeholder: (context, url) => Center(
                    child: SizedBox(
                        height: Get.height * 0.06,
                        width: Get.width * 0.08,
                        child: const Center(child: CircularProgressIndicator())),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                // Image.network(
                //   controller.orderListShow[index]['image'],
                //   width: 161,
                // ),
              )
            ],
          ),
        ),
      ),
    ),
  );
});
