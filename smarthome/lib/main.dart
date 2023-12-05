import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/core/app/app.dart';
import 'package:smarthome/firebase_options.dart';
import 'package:smarthome/homepage/notif_messaging/messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Messaging();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SmartHomeApp(),
    ),
  );
}