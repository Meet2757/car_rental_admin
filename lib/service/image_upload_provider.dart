// import 'dart:html';
//
// import 'package:get/get.dart';
//
// class ImageUploadProvider extends GetConnect {
//
//   Future<String> uploadImage(List<String>list) async {
//     try {
//       final form = FormData({});
//       for (String path in list) {
//         form.fields.add(MapEntry("file[]",
//             MultipartFile(File(path), filename: "${DateTime.now().millisecondsSinceEpoch}.${path.split('.').last}")));
//       }
//       final response = await post()
//     }
//     catch (exception) {
//       return Future.error(exception.toString());
//     }
//   }
// }