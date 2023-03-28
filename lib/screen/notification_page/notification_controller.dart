import 'package:car_rental_admin/screen/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{

  void backButton(){
    Get.back(result: const DashboardScreen());
  }
}