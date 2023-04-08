import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/common/space_and_dividers.dart';
import 'package:car_rental_admin/common/widgets/common_appbar.dart';
import 'package:car_rental_admin/common/widgets/common_button.dart';
import 'package:car_rental_admin/screen/Add_Car_Page/add_car_screen_controller.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget addCarAppBar = GetBuilder<AddCarScreenController>(
  builder: (controller) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.020),
      child: commonAppBar(
        start: InkWell(onTap: () {}, child: backButton()),
        text: StringRes.addCars,
        end: AssetRes.notificationAppbar,
      ),
    );
  },
);

Widget carName = GetBuilder<AddCarScreenController>(
  id: "carName",
  builder: (controller) {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * 0.08,
                child: TextFormField(
                  controller: controller.carName,
                  onTap: () {
                    controller.carName;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: label(
                                text: StringRes.carName,
                                size: 14,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                          WidgetSpan(
                            child: label(
                                text: StringRes.star,
                                size: 14,
                                color: ColorRes.mahogany,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter Car Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Car Name';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * 0.08,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.carPrice,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: label(
                                text: StringRes.carPrice,
                                size: 14,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                          WidgetSpan(
                            child: label(
                                text: StringRes.star,
                                size: 14,
                                color: ColorRes.mahogany,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter Car Price',
                  ),
                  onTap: () {
                    controller.carPrice;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Car Price';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: label(
                          text: StringRes.carGearBox,
                          size: 14,
                          fontFamily: AssetRes.poppinsRegular),
                    ),
                    WidgetSpan(
                      child: label(
                          text: StringRes.star,
                          size: 14,
                          color: ColorRes.mahogany,
                          fontFamily: AssetRes.poppinsRegular),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Obx(
                    () => Radio(
                      value: "Automatic",
                      groupValue: controller.selectedRadio.value,
                      onChanged: (value) {
                        controller.changeSelectedRadio(value);
                      },
                    ),
                  ),
                  label(
                      text: StringRes.automatic,
                      size: 12,
                      fontFamily: AssetRes.poppinsRegular),
                  Obx(
                    () => Radio(
                      value: "Manual",
                      groupValue: controller.selectedRadio.value,
                      onChanged: (value) {
                        controller.changeSelectedRadio(value);
                      },
                    ),
                  ),
                  label(
                      text: StringRes.manual,
                      size: 12,
                      fontFamily: AssetRes.poppinsRegular),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * 0.08,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.carSpeed,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: label(
                                text: StringRes.carSpeed,
                                size: 14,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                          WidgetSpan(
                            child: label(
                                text: StringRes.star,
                                size: 14,
                                color: ColorRes.mahogany,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter Car Speed',
                  ),
                  onTap: () {
                    controller.carSpeed;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Car Speed';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * 0.08,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.carDoor,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: label(
                                text: StringRes.carDoor,
                                size: 14,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                          WidgetSpan(
                            child: label(
                                text: StringRes.star,
                                size: 14,
                                color: ColorRes.mahogany,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter Car Door',
                  ),
                  onTap: () {
                    controller.carDoor;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Car Door';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * 0.08,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.carSheet,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: label(
                                text: StringRes.carSheet,
                                size: 14,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                          WidgetSpan(
                            child: label(
                                text: StringRes.star,
                                size: 14,
                                color: ColorRes.mahogany,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter Car Sheet',
                  ),
                  onTap: () {
                    controller.carSheet;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Car Sheet';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * 0.11,
                child: TextFormField(
                  controller: controller.carDescription,
                  decoration: InputDecoration(
                    hoverColor: ColorRes.gray,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: label(
                                text: StringRes.carDescription,
                                size: 14,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                          WidgetSpan(
                            child: label(
                                text: StringRes.star,
                                size: 14,
                                color: ColorRes.mahogany,
                                fontFamily: AssetRes.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter Car Description',
                  ),
                  onTap: () {
                    controller.carDescription;
                  },
                  maxLength: 100,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Car Description';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: label(
                          text: StringRes.carType,
                          size: 14,
                          fontFamily: AssetRes.poppinsRegular),
                    ),
                    WidgetSpan(
                      child: label(
                          text: StringRes.star,
                          size: 14,
                          color: ColorRes.mahogany,
                          fontFamily: AssetRes.poppinsRegular),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Obx(
                    () => Radio(
                      value: "petrol",
                      groupValue: controller.selectedRadios.value,
                      onChanged: (value) {
                        controller.changeSelectedRadios(value);
                      },
                    ),
                  ),
                  label(
                      text: StringRes.petrol,
                      size: 12,
                      fontFamily: AssetRes.poppinsRegular),
                  Obx(
                    () => Radio(
                      value: "diesel",
                      groupValue: controller.selectedRadios.value,
                      onChanged: (value) {
                        controller.changeSelectedRadios(value);
                      },
                    ),
                  ),
                  label(
                      text: StringRes.diesel,
                      size: 12,
                      fontFamily: AssetRes.poppinsRegular),
                  Obx(
                    () => Radio(
                      value: "electronic",
                      groupValue: controller.selectedRadios.value,
                      onChanged: (value) {
                        controller.changeSelectedRadios(value);
                      },
                    ),
                  ),
                  label(
                      text: StringRes.electronic,
                      size: 12,
                      fontFamily: AssetRes.poppinsRegular),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: label(
                          text: StringRes.carImage,
                          size: 14,
                          fontFamily: AssetRes.poppinsRegular),
                    ),
                    WidgetSpan(
                      child: label(
                          text: StringRes.star,
                          size: 14,
                          color: ColorRes.mahogany,
                          fontFamily: AssetRes.poppinsRegular),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: controller.listImagePath.length+1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return index == 0 ? InkWell(
                      onTap: () {
                        controller.selectMultipleImage();
                      },
                      child: DottedBorder(
                          borderType: BorderType.Rect,
                          padding: const EdgeInsets.all(40),
                          child: const Icon(
                            Icons.add,
                            size: 25,
                            color: ColorRes.black,
                          )),
                    ):SizedBox(
                      width:150,
                      child: Image.file(controller.listImagePath[index-1]),);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.loginData();
                      } else {
                        controller.formKey.currentState!.validate();
                      }
                    },
                    child: Container(
                      child: commonDoneButton(StringRes.saveButton),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(Get.height * 0.01)
          ],
        ),
      ),
    );
  },
);
