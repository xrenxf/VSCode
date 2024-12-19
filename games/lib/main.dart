import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAUAaDzC1IJVTvcwSm7ovHOtDyj3_mguHY",
      authDomain: "jumperbird-e5912.firebaseapp.com",
      projectId: "jumperbird-e5912",
      storageBucket: "jumperbird-e5912.appspot.com",
      messagingSenderId: "295701727622",
      appId: "1:295701727622:web:60467364011e00930f8407",
      measurementId: "G-NM8VH63DTH"
    )
  );

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
