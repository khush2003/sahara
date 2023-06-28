import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/delivery_status_controller.dart';

import '../components/DeliveryPage/delivery_card.dart';
import '../models/donation_item.dart';
import '../models/user.dart';
import '../theme/app_theme.dart';

class DeliveryView extends StatelessWidget {
  DeliveryView({super.key});
  final DonationItem item = DonationItem.test();
  final UserSahara user = UserSahara.test();
  final arrDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TabBarDeliveryStatus();
  }
}

class TabBarDeliveryStatus extends StatelessWidget {
  final controller = Get.put(DeliveryStatusController());
  TabBarDeliveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: titleBackground,
            title: const Text('Delivery Page'),
            bottom: const TabBar(tabs: <Widget>[
              Tab(text: 'In Transit'),
              Tab(text: 'To Deliver'),
              Tab(text: 'To Receive'),
              Tab(text: 'Delivered'),
            ]),
          ),
          body: TabBarView(
            children: [
              Obx(() => ListItems(
                  items: controller.inTransitList,
                  user: controller.auth.userSahara.value)),
              Obx(() => ListItems(
                  items: controller.toDeliverList,
                  user: controller.auth.userSahara.value)),
              Obx(() => ListItems(
                  items: controller.toReceiveList,
                  user: controller.auth.userSahara.value)),
              Obx(() => ListItems(
                  items: controller.deliveredList,
                  user: controller.auth.userSahara.value)),
            ],
          ),
        ));
  }
}

class ListItems extends StatelessWidget {
  final List<DonationItem> items;
  final UserSahara user;
  const ListItems({super.key, required this.items, required this.user});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(child: Text("No Items Found", style: headTextBold()));
    }
    return SingleChildScrollView(
      child: Column(
          children: items
              .map((element) => ToReceiveCard(user: user, item: element))
              .toList()),
    );
  }
}
