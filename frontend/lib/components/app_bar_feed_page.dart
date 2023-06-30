import 'package:flutter/material.dart';
import 'package:sahara/components/Feed/search_bar.dart';
import 'package:sahara/controllers/donation_item_controller.dart';
import 'package:unicons/unicons.dart';
import 'Feed/filter_menu.dart';

class AppBarFeedPage extends StatelessWidget implements PreferredSizeWidget {
  AppBarFeedPage({super.key});
  final itemController = DonationItemController.instance;
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
        onPressed: itemController.routeToCreateDonation,
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
          onPressed: () => showSearchDialog(),
          icon: const Icon(UniconsLine.search),
        ),
      ],
    );
  }
}
