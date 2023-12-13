import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/core/core.dart';
import 'package:ui_common/ui_common.dart';

import '../widgets/lighted_background.dart';
import '../widgets/page_indicators.dart';
import '../widgets/sm_home_bottom_navigation.dart';
import '../widgets/smart_room_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.8);
  final ValueNotifier<double> pageNotifier = ValueNotifier(0);
  final ValueNotifier<int> roomSelectorNotifier = ValueNotifier(-1);

  @override
  void initState() {
    controller.addListener(pageListener);
    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(pageListener)
      ..dispose();
    super.dispose();
  }

  void pageListener() {
    pageNotifier.value = controller.page ?? 0;
  }

  void logout(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return LightedBackgound(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const ShAppBar(),

        drawer: Drawer(
          width: 200,
          child: Container(
            color: Colors.grey[800],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Icon(Icons.favorite),
                    ),

                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.home,
                          color: Colors.white,),
                        title: const Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/home_screen');
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          ),
                        title: const Text(
                          'Setting',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.person,
                          color: Colors.white,),
                        title: const Text(
                          'Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/profile_page');
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.people,
                          color: Colors.white,),
                        title: const Text(
                          'Users',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/users_page');
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.public,
                          color: Colors.white,),
                        title: const Text(
                          'Webview',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/webview_page');
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.notes_outlined,
                          color: Colors.white,),
                        title: const Text(
                          'Noted',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/appwrite_page');
                        },
                      ),
                    )
                  ]
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 25),
                    child: ListTile(
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Log Out',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        logout();
                      },
                    ),
                ),
              ],
            ),
          ),
        ),

        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text("SELECT A ROOM", style: context.bodyLarge),
              height32,
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    SmartRoomsPageView(
                      pageNotifier: pageNotifier,
                      roomSelectorNotifier: roomSelectorNotifier,
                      controller: controller,
                    ),
                    Positioned.fill(
                      top: null,
                      child: Column(
                        children: [
                          PageIndicators(
                            roomSelectorNotifier: roomSelectorNotifier,
                            pageNotifier: pageNotifier,
                          ),
                          SmHomeBottomNavigationBar(
                            roomSelectorNotifier: roomSelectorNotifier,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
