import 'package:flutter/material.dart';
import 'package:smarthome/appwrite/appwrite_page.dart';
import 'package:smarthome/core/core.dart';
import 'package:smarthome/features/home/presentation/screens/home_screen.dart';
import 'package:smarthome/homepage/auth/auth.dart';
import 'package:smarthome/homepage/auth/login_or_register.dart';
import 'package:smarthome/homepage/log_reg_page/profile_page.dart';
import 'package:smarthome/homepage/log_reg_page/users_page.dart';
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
          home: const AuthPage(),
          routes: {
            '/login_register_page': (context) => const LoginOrRegister(),
            '/home_screen': (context) => const HomeScreen(),
            '/profile_page':(context) => ProfilePage(),
            '/users_page':(context) => const UsersPage(),
            '/webview_page':(context) => const WebViewPage(),
            '/appwrite_page':(context) => const AppWritePage(),
          }
        );
      },
    );
  }
}
