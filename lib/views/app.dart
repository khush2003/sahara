import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/app_bottom_nav_bar.dart';
import 'package:sahara/views/profile.dart';
import 'package:sahara/views/chat.dart';
import 'package:sahara/views/delivery.dart';
import 'package:sahara/views/feed.dart';
import 'package:sahara/views/notifications.dart';

import '../controllers/nav_bar_controller.dart';

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
