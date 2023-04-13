import 'package:car_rental_admin/common/space_and_dividers.dart';
import 'package:car_rental_admin/screen/Add_Car_Page/add_car_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCarScreen extends StatelessWidget {
  const AddCarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              addCarAppBar,
              verticalSpace(Get.height*0.02),
              carName,
            ],
          ),
        ),
      ),
    );
  }
}
