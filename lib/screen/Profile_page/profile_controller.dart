import 'dart:io';

import 'package:car_rental_admin/common/common_text_and_style.dart';
import 'package:car_rental_admin/screen/notification_page/notification_screen.dart';
import 'package:car_rental_admin/service/pref_service.dart';
import 'package:car_rental_admin/utils/color_res.dart';
import 'package:car_rental_admin/utils/string_res.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  //------------------------------TextForm-------------------------------------
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //-------------------------------image Picker---------------------------------
  final picker = ImagePicker();
  bool profile = false;
  String? imageProfile;
  FirebaseDatabase database = FirebaseDatabase.instance;
  String updateKey = "";
  //----------------------------------Store a data in firebase -------------------
  DatabaseReference databases = FirebaseDatabase.instance.ref('Admin').child('ProfileData');
  Map adminProfileDetails = {};
  //--------------------------------get adminImage -----------------------------



  @override
  void onInit() {
    // TODO: implement onInit
    getProfileData();
    super.onInit();
  }

  void onTapProfile() {
    profile = !profile;
    update(['profile']);
  }

  Future<void> pickGalleryImage(BuildContext context) async {
    XFile? pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('admin/AdminProfile.jpg');
      TaskSnapshot task = await ref.putFile(File(pickedFile.path));
      final imageUrl = await task.ref.getDownloadURL();
      imageProfile = imageUrl;
      String? key = PrefServices.getString("userEmail") ;
      print(key);
      updateKey = key;
      database.ref("Admin").child("ProfileData").child(key).update({"ProfileImage": imageProfile,});
    }
    update(['profile']);
  }

  Future<void> pickCameraImage(BuildContext context) async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('admin/AdminProfile.jpg');
      TaskSnapshot task = await ref.putFile(File(pickedFile.path));
      final imageUrl = await task.ref.getDownloadURL();
      imageProfile = imageUrl;
    }
    update(['profile']);
  }

  void pickImage(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    pickCameraImage(context);
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.camera,
                    size: 30,
                  ),
                  title: label(text: StringRes.camera, color: ColorRes.gray63),
                ),
                ListTile(
                  onTap: () {
                    pickGalleryImage(context);
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.image,
                    size: 30,
                  ),
                  title: label(text: StringRes.gallery, color: ColorRes.gray63),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> getProfileData() async {
    await databases.once().then((value) {
      Map temp = value.snapshot.value as Map;
      print(temp);
      firstName.text = temp["FirstName"];
      lastName.text = temp["LastName"];
      phone.text = temp["Phone_no"];
      email.text = temp["Email"];
      imageProfile=temp["ProfileImage"];
      adminProfileDetails.addAll(temp);
      print(adminProfileDetails);
    });
    update(["profileDetails"]);
  }

  void profileData(){
    String? key = PrefServices.getString("userEmail") ;
    print(key);
    updateKey = key;
    database.ref("Admin").child("ProfileData").child(key).set({
      "FirstName": firstName.text,
      "LastName": lastName.text,
      "Email": email.text,
      "Phone_no": phone.text,
      "ProfileImage": imageProfile,
    });
  }


  //-------------Navigation auth--------------------

  void notification() {
    Get.to(const NotificationScreen());
  }
}
