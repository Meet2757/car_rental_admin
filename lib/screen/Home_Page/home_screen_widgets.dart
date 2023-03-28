import 'package:car_rental_admin/common/widgets/common_button.dart';
import 'package:car_rental_admin/screen/Home_Page/home_screen_controller.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget carList = GetBuilder<HomeScreenController>(builder: (controller) {
  return Expanded(
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: controller.carListShow.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
        child: InkWell(
          onTap: () {},
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 150,
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
                  children: [
                    Column(
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
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, top: 45.0),
                              child: Container(
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
                                child: commonPriceButton(
                                    controller.carListShow[index]['price']),
                              ),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 45.0),
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 45.0),
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
                  ],
                ),
              ),
              Positioned(
                child: Image.asset(
                  controller.carListShow[index]['image'],
                  width: 161,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
});
