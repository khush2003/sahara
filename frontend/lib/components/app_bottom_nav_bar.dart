import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:unicons/unicons.dart';

import '../controllers/nav_bar_controller.dart';
import '../theme/app_theme.dart';
import '../utils/uni_icon.dart';

class AppBottomNavBar extends StatelessWidget {
  final NavBarController navController;
  const AppBottomNavBar({
    super.key, required this.navController,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 10))),
      child: Obx(() => SalomonBottomBar(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          backgroundColor: const Color(0xffffffff),
          itemPadding: const EdgeInsets.all(16),
          selectedItemColor: primary,
          onTap: navController.changeIndex,
          currentIndex: navController.selectedIndex,
          items: [
            SalomonBottomBarItem(
                icon: const UnIcon(
                  UniconsLine.estate,
                  size: 20,
                ),
                title: const Text("Home")),
            SalomonBottomBarItem(
                icon: const UnIcon(
                  UniconsLine.truck,
                  size: 20,
                ),
                title: const Text("Delivery")),
            SalomonBottomBarItem(
                icon: const UnIcon(
                  UniconsLine.comment,
                  size: 20,
                ),
                title: const Text("Chat")),
            SalomonBottomBarItem(
                icon: const UnIcon(
                  UniconsLine.bell,
                  size: 20,
                ),
                title: const Text("Notification")),
            SalomonBottomBarItem(
                icon: const UnIcon(
                  UniconsLine.user,
                  size: 20,
                ),
                title: const Text("User")),
          ])),
    );
  }
}
