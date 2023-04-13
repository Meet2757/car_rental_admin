import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddCarScreenController extends GetxController {
  TextEditingController carName = TextEditingController();
  TextEditingController carPrice = TextEditingController();
  TextEditingController carSpeed = TextEditingController();
  TextEditingController carDoor = TextEditingController();
  TextEditingController carSheet = TextEditingController();
  TextEditingController carDescription = TextEditingController();
  String? key;

  final ImagePicker _picker = ImagePicker();
  List<XFile>? images = [];
  List<File> listImagePath = [];
  FirebaseDatabase database = FirebaseDatabase.instance;
  String updateKey = "";
  final formKey = GlobalKey<FormState>();
  var selectedRadio = "".obs;
  var selectedCarFuel = "".obs;

  void changeSelectedRadio(var gearBox) {
    selectedRadio.value = gearBox;
    update(['changeSelectRadio']);
  }

  void chengSelectedCarFuel(var fuelType) {
    selectedCarFuel.value = fuelType;
    update(['changeSelectRadio']);
  }


  Future<void> onTepEdit(String key) async {
    await database.ref("Admin").child("AddCar").child(key).get().then((value) {
      print(value.value);
      if (value.value != null) {
        Map data = value.value as Map;
        carName.text = data["CarName"];
        carPrice.text = data["CarPrice"];
        carSpeed.text = data["CarSpeed"];
        carDoor.text = data["CarDoor"];
        carSheet.text = data["CarSheet"];
        carDescription.text = data["CarDescription"];
        this.key = key;
        selectedRadio.value = data["GearBox"];
        selectedCarFuel.value = data["CarType"];
        //listImagePath = data["CarImage"];
      }
    });
  }

  void selectMultipleImage() async {
    final List<XFile> selectImage = await _picker.pickMultiImage();
    if (selectImage.isNotEmpty) {
      images!.addAll(selectImage);
    }
    for (var element in images!) {
      listImagePath.add(File(element.path));
    }
    update(["carName"]);
  }

  Future<void> addCarData() async {
    String? key = database.ref("Admin").child("AddCar").push().key;
    List<String> imageList = [];
    int counter = 0;
    for (var element in listImagePath) {
      Reference ref =
          FirebaseStorage.instance.ref().child('cars/$key/${counter}.jpg');
      TaskSnapshot task = await ref.putFile(element);
      final imageUrl = await task.ref.getDownloadURL();
      imageList.add(imageUrl);
      counter++;
    }
    Map data = {
      "CarName": carName.text,
      "CarPrice": carPrice.text,
      "GearBox": selectedRadio.value,
      "CarSpeed": carSpeed.text,
      "CarDoor": carDoor.text,
      "CarSheet": carSheet.text,
      "CarDescription": carDescription.text,
      "CarType": selectedCarFuel.value,
      "CarImage": imageList,
    };

    print(key);
    updateKey = key!;
    await database.ref("Admin").child("AddCar").child(key).set(data);
    homeScreen(data);
  }

  void homeScreen(Map data) {
    Get.back(result: data);
  }
}
