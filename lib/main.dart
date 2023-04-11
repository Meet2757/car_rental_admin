import 'package:car_rental_admin/screen/Home_Page/home_screen.dart';
import 'package:car_rental_admin/screen/dashboard/dashboard_screen.dart';
import 'package:car_rental_admin/screen/sign_in_screen/sign_in_screen.dart';
import 'package:car_rental_admin/service/pref_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await PrefServices.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String isLogin = PrefServices.getString("isLogin");
    return  GetMaterialApp(
      title: 'CarRental',
      home: isLogin!=""?const HomepageDrawer():const SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
