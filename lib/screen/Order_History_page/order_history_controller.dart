import 'package:car_rental_admin/screen/Order_List_Page/order_list_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {

  String oId = "";
  DatabaseReference database = FirebaseDatabase.instance.ref('Admin').child('Order');
  Map<String?, dynamic> orderListHistoryShow = {};
  List images = [];
  bool isLoading = false;


  @override
  void onInit() {
    // TODO: implement onInit
    //getCarData(oId);
    super.onInit();
  }


  Future<void> getOrderData(String oId) async {
    isLoading = true;
    await database.child(oId).get().then((value) {
      Map temp = value.value as Map;
      print(temp);
      images.clear();
      orderListHistoryShow.addAll(
        {
          "key" : oId,
          "UserImage" : temp["imageProfile"],
          "UserName" : temp["first_name"],
          "Phone" : temp["phone"],
          "Birth_Date" : temp["Dob"],
          "Gender" : temp["Gender"],
          "toDate" : temp["ToDate"],
          "fromDate" : temp["FormDate"],
          "CarImage" : temp["image"][0],
          "Description" : temp["description"],
          "aadhaar" : temp["Aadhaar"],
          "licence" : temp["Licence"],
          "photo" : temp["Photo"],
        },
      );
    });
    isLoading = false;
    print(orderListHistoryShow);
    update(["orderHistory"]);
  }

  void backListScreen(){
    Get.off(()=>const OrderListScreen());

  }

  void disPose() {
    oId = "";
    orderListHistoryShow = {};
    images = [];
  }
}
