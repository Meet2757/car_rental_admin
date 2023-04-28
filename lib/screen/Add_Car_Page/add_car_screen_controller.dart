import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
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
  String? editCarKey;
  bool isLoading = false;
  var dropDownList = ["All","Sedan","Suv","Mpv","Hatchback"];
  List<File> listImagePath = [];
  List oldImageUrlList = [];
  List<String> deleteImageList = [];
  FirebaseDatabase database = FirebaseDatabase.instance;
  String updateKey = "";
  final formKey = GlobalKey<FormState>();
  var selectedRadio = "".obs;
  var selectedCarFuel = "".obs;
  RxString valueChooseDropDown = "Sedan".obs;

  void changeSelectedRadio(var gearBox) {
    selectedRadio.value = gearBox;
    update(['changeSelectRadio']);
  }

  void chengSelectedCarFuel(var fuelType) {
    selectedCarFuel.value = fuelType;
    update(['changeSelectRadio']);
  }

  Future<void> onTepEdit(String key) async {
    oldImageUrlList.clear();
    await database.ref("Admin").child("AddCar").child(key).get().then((value) {
      print(value.value);
      if (value.value != null) {
        Map data = value.value as Map;
        editCarKey = key;
        carName.text = data["CarName"];
        carPrice.text = data["CarPrice"];
        carSpeed.text = data["CarSpeed"];
        carDoor.text = data["CarDoor"];
        carSheet.text = data["CarSheet"];
        carDescription.text = data["CarDescription"];
        selectedRadio.value = data["GearBox"];
        selectedCarFuel.value = data["CarFuel"];
        valueChooseDropDown.value = data["CarType"];
        oldImageUrlList.addAll(data["CarImage"]);
      }
    });
    update(["oldImage"]);
  }

  Future<void> removeImage(int index) async {
    deleteImageList.add(oldImageUrlList[index]);
    oldImageUrlList.removeAt(index);
    print(oldImageUrlList.length);
    update(["oldImage"]);
  }

  void selectMultipleImage() async {
    final List<XFile> selectImage = await ImagePicker().pickMultiImage();
    for (var element in selectImage) {
      listImagePath.add(File(element.path));
    }
    update(["carName"]);
  }

  Future<void> addCarData() async {
    String? key = database.ref("Admin").child("AddCar").push().key;
    List<String> imageList = [];
    int counter = 0;
    for (var element in listImagePath) {
      Reference ref = FirebaseStorage.instance.ref().child('cars/$key$counter.jpg');
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
      "CarFuel": selectedCarFuel.value,
      "CarType": valueChooseDropDown.value,
      "CarImage": imageList,
    };
    if (kDebugMode) {
      print(key);
    }
    await database.ref("Admin").child("AddCar").child(key!).set(data);
    data["key"] = key;
    homeScreen(data: data);
  }

  Future<void> onTapSave() async {
    for(var element in deleteImageList){
      await FirebaseStorage.instance.refFromURL(element).delete();
    }
    int counter = oldImageUrlList.length;
    for (var element in listImagePath) {
      Reference ref =
      FirebaseStorage.instance.ref().child('cars/$editCarKey$counter.jpg');
      TaskSnapshot task = await ref.putFile(element);
      final imageUrl = await task.ref.getDownloadURL();
      oldImageUrlList.add(imageUrl);
      counter++;
    }
    Map<String,dynamic> data = {
      "CarName": carName.text,
      "CarPrice": carPrice.text,
      "GearBox": selectedRadio.value,
      "CarSpeed": carSpeed.text,
      "CarDoor": carDoor.text,
      "CarSheet": carSheet.text,
      "CarDescription": carDescription.text,
      "CarFuel": selectedCarFuel.value,
      "CarType": valueChooseDropDown.value,
      "CarImage": oldImageUrlList,
    };
    print(editCarKey);
    await database.ref("Admin").child("AddCar").child(editCarKey!).update(data);
    homeScreen();
  }

  void onTapButton(){
    if(editCarKey == null){
      addCarData();
    }
    else{
      onTapSave();
    }
  }

  void homeScreen({Map? data}) {
    Get.back(result: data);
  }
}
