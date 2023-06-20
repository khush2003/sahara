import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/app_bottom_nav_bar.dart';
import '../controllers/nav_bar_controller.dart';
import 'chat.dart';
import 'delivery.dart';
import 'feed.dart';
import 'notifications.dart';
import 'profile.dart';

class App extends StatelessWidget {
  App({super.key});
  final navController = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
              index: navController.selectedIndex,
              children: [
                FeedView(),
                DeliveryView(),
                ChatView(),
                NotificationsView(),
                Profile()
              ])),
      bottomNavigationBar: AppBottomNavBar(
        navController: navController,
      ),
    );
  }
}
