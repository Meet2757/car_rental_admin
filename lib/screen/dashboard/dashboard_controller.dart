import 'package:car_rental_admin/screen/notification_page/notification_screen.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController{
  int index = 0;

  void setIndex(int value){
    index = value;
    update(["bottom"]);
  }

  void notification(){
    Get.to(const NotificationScreen());
  }

}