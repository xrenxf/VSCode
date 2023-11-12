import 'package:flutter/material.dart';
import 'package:smarthome/core/core.dart';
import 'package:smarthome/features/home/presentation/screens/home_screen.dart';
import 'package:ui_common/ui_common.dart';

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart Home App',
          theme: SHTheme.dark,
          home: const HomeScreen(),
        );
      },
    );
  }
}
