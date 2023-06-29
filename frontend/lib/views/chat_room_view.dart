import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/chat/chat_room_controller.dart';
import 'package:sahara/controllers/donation_item_controller.dart';
import 'package:sahara/models/donation_item.dart';
import '../components/Chat/chat_list_card.dart';

class ChatRoomView extends StatelessWidget {
  final controller = Get.put(ChatRoomController());
  final itemController = DonationItemController.instance;
  ChatRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fai's View"),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: controller.chatRooms
                    .map((room) => Obx(
                      () => ChatListCard(
                            room: room, item: DonationItem.getFromId(room.donationId, itemController.donationItems),
                          ),
                    ))
                    .toList()),
          ),
        ));
  }
}
