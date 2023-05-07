import 'package:car_rental_admin/screen/notification_page/notification_screen.dart';
import 'package:car_rental_admin/screen/sign_in_screen/sign_in_screen.dart';
import 'package:car_rental_admin/service/pref_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController{
  int index = 0;
  final auth = FirebaseAuth.instance;
  String? imageProfile;
  FirebaseDatabase database = FirebaseDatabase.instance;
  String updateKey = "";
  DatabaseReference databases = FirebaseDatabase.instance.ref('Admin').child('ProfileData');
  Map adminProfileDetails = {};

  @override
  void onInit() {
    // TODO: implement onInit
    getProfileData();
    super.onInit();
  }

  void setIndex(int value){
    index = value;
    update(["bottom"]);
  }

  Future<void> getProfileData() async {
    await databases.once().then((value) {
      Map temp = value.snapshot.value as Map;
      //print(temp);
      imageProfile=temp["ProfileImage"];
      adminProfileDetails.addAll(temp);
      //print(adminProfileDetails);
    });
    update(["profileDetails"]);
  }

  void profileData() {
    String? key = PrefServices.getString("userEmail");
    //print(key);
    updateKey = key;
    database.ref("Admin").child("ProfileData").child(key).set({
      "ProfileImage": imageProfile,
    });
  }


  void notification(){
    Get.to(()=>const NotificationScreen());
  }

  void signInScreen() {
    Get.to(() => const SignInScreen());
  }

}