import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/server/api/server_controller.dart';
import 'package:hotel/pages/authorization/authorization.dart';
import 'package:hotel/service/auth.dart';
import 'package:hotel/service/firestore_service.dart';
import 'controller/booking_page_controller/booking_page_controller.dart';
import 'controller/hotel_controller/hotel_controller.dart';
import 'controller/theme/theme_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(FireStoreService());
  Get.put(HotelController());
  Get.put(AuthorizationService());
  Get.put(SearchController());
  //Get.put(RoomController());
  Get.put(SearchController());
  Get.put(ServerController());
  Get.put(BookingPageController());
  final themeController = Get.put(ThemeController());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: themeController.lightTheme,
    home: const Authorization(),
  ));
}
