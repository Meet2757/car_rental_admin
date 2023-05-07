import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental_admin/common/widgets/common_button.dart';
import 'package:car_rental_admin/screen/Home_Page/home_screen_controller.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget carList = GetBuilder<HomeScreenController>(
    id: "cars",
    builder: (controller) {
      return Expanded(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.carListShow.length,
          itemBuilder: (context, index) => Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 150,
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                        child: Text(
                          controller.carListShow[index]['title'],
                          style: const TextStyle(
                              fontSize: 16, fontFamily: AssetRes.poppinsBold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                        child: Text(
                          controller.carListShow[index]['subtitle'],
                          style: const TextStyle(
                              color: ColorRes.gray63,
                              fontSize: 10,
                              fontFamily: AssetRes.poppinsBold),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          commonPriceButton(
                              controller.carListShow[index]['price']),
                          const Spacer(),
                          InkWell(
                            onTap: () => controller.editCarDetails(
                                controller.carListShow[index]['key']),
                            child: Container(
                              width: 40,
                              decoration: const BoxDecoration(
                                color: ColorRes.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorRes.gray63,
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: commonEditButton(),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () => controller.deleteCar(controller.carListShow[index]['key'],index),
                            child: Container(
                              width: 40,
                              decoration: const BoxDecoration(
                                color: ColorRes.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorRes.gray63,
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: commonDeleteButton(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -10,
                  child: CachedNetworkImage(
                    imageUrl: controller.carListShow[index]['image'],
                    width: 140,
                    placeholder: (context, url) => Center(
                      child: SizedBox(
                          height: Get.height * 0.04,
                          width: Get.width * 0.04,
                          child:
                          const Center(child: CircularProgressIndicator())),
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });

Widget addNewCar = GetBuilder<HomeScreenController>(builder: (controller) {
  return Align(
    alignment: Alignment.bottomRight,
    child: Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: FloatingActionButton.extended(
        onPressed: () => controller.addCar(),
        label: const Text(StringRes.addCar),
        backgroundColor: ColorRes.darkSlateGray,
        icon: const Icon(Icons.add),
        tooltip: StringRes.addCar,
      ),
    ),
  );
});
