import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unicons/unicons.dart';

import '../routes/routes.dart';
import 'Feed/filter_menu.dart';

class AppBarFeedPage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarFeedPage({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TabBar(
        tabs: [
          Tab(
            // text: 'Reviews',
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 10),
                Text('Reviews',
                    style: TextStyle(
                        fontFamily: "Dongle",
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        height: 0.5,
                        color: Colors.white)),
              ],
            ),
          ),
          Tab(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 10),
                Text('Donations',
                    style: TextStyle(
                        fontFamily: "Dongle",
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        height: 0.5,
                        color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
      leading: IconButton(
        onPressed: () {
          Get.toNamed(Routes.createDonation);
        },
        icon: const Icon(UniconsLine.plus_circle),
      ),
      actions: [
        IconButton(
          onPressed: () {
            openFilterDialog();
          },
          icon: const Icon(UniconsLine.filter),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(UniconsLine.search),
        ),
      ],
    );
  }
}
