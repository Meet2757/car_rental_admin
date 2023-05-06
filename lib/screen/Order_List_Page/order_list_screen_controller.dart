import 'package:car_rental_admin/screen/Home_Page/home_screen.dart';
import 'package:car_rental_admin/screen/Order_History_page/order_history_controller.dart';
import 'package:car_rental_admin/screen/Order_History_page/order_history_screen.dart';
import 'package:car_rental_admin/utils/asset_res.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController{

  DatabaseReference database = FirebaseDatabase.instance.ref('Admin').child('Order');
  List<Map<String?, dynamic>> orderListShow = [];

  @override
  void onInit() {
    // TODO: implement onInit
    getOrderData();
    super.onInit();
  }

  Future<void> getOrderData() async {
    await database.once().then((value) {
      Map temp = value.snapshot.value as Map;
      print(temp);
      temp.forEach((key,value){
        print(value);
        orderListShow.add(
          {
            "key": key,
            "title": value["title"],
            "subtitle": value["CarType"],
            "price": value["price"],
            "image": value["image"][0],
            "userImage": value["imageProfile"],
          },
        );
      });
      print(orderListShow);
    });
    update(["order"]);
  }

  void carOrderDetails(String oId) {
    Get.put(OrderHistoryController())
      ..oId = oId
      ..getOrderData(oId);
    Get.to(() => const OrderHistoryScreen());
  }
    void backButton(){
    Get.to(const HomeScreen());
  }

  void orderHistoryScreen(){
    Get.to(const OrderHistoryScreen());
  }

}
