import 'package:car_rental_admin/screen/Order_History_page/order_history_screen.dart';
import 'package:car_rental_admin/screen/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'CarRental',
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
