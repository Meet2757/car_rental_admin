import 'package:car_rental_admin/common/widgets/common_appbar.dart';
import 'package:car_rental_admin/screen/Home_Page/home_screen.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController{

  List<Map<String?, dynamic>> carListShow = [
    {
      "userImage": AssetRes.user,
      "title": "User-Name",
      "subtitle": "Booking-Date",
      "price": "999",
      "image": AssetRes.hondaCivic,
    },
  ];

  void backButton(){
    Get.to(const HomeScreen());
  }

}
