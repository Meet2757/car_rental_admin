import 'package:car_rental_admin/screen/Order_List_Page/order_list_screen.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {

  Map<String?, dynamic> orderListHistoryShow =
    {
      "userImage": AssetRes.user,
      "title": "Honda Civic",
      "name": "User",
      "email": "user123@gmail.com",
      "phone_no": "+919825802522",
      "birthday": "03/02/2003",
      "date": "31/10/2022",
      "gender": "Male",
      "subtitle": "Automatic/Manual",
      "price": "999",
      "description": "The term 'SUV' is car industry jargon that's an acronym for Sports Utility Vehicle. It refers to a type of car that sits high off the ground and which often has four-wheel drive and rugged styling.",
      "image": AssetRes.hondaCivic,
      "aadhaar": AssetRes.aadhaarLogo,
      "license": AssetRes.drivingLogo,
      "photo": AssetRes.passPhotoLogo,
    };

  void backListScreen(){
    Get.off(const OrderListScreen());

  }

}
