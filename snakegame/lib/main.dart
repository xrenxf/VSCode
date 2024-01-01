import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAKjlxI-bHQcuZGVsZ2FiwcFzJKIhwAE9o",
      authDomain: "snakegame-437d8.firebaseapp.com",
      projectId: "snakegame-437d8",
      storageBucket: "snakegame-437d8.appspot.com",
      messagingSenderId: "909643217084",
      appId: "1:909643217084:web:05c1ddf26131ff67e738b9",
      measurementId: "G-0CWEDSP3CZ"
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
