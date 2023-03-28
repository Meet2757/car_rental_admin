import 'package:car_rental_admin/screen/Home_Page/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Prectice extends StatelessWidget {
  const Prectice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: const [
                  Text('To',style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
