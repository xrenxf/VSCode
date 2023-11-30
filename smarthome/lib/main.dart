import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/core/app/app.dart';
import 'package:smarthome/firebase_options.dart';
import 'package:smarthome/homepage/notif_messaging/messaging.dart';

import 'package:appwrite/appwrite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Messaging();

  Client client = Client();
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6566017e79c56edd96bd')
        .setSelfSigned(status: true);

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SmartHomeApp(),
    ),
  );
}