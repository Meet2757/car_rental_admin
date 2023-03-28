import 'package:car_rental_admin/screen/Home_Page/home_screen.dart';
import 'package:car_rental_admin/screen/notification_page/notification_screen.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  List<Map<String?, dynamic>> carListShow = [
    {
      "title": "Honda Civic",
      "subtitle": "Automatic/Manual",
      "price": "999",
      "image": AssetRes.hondaCivic,
    },
  ];


  void notification(){
    Get.to(const NotificationScreen());
  }
}