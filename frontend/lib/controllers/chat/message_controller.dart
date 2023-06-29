import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/controllers/chat/chat_room_controller.dart';
import 'package:sahara/controllers/donation_item_controller.dart';
import 'package:sahara/models/chat_room.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/models/message.dart';
import 'package:sahara/rest_api.dart';
import 'package:sahara/routes/routes.dart';
import 'package:sahara/utils/app_utils.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessageController extends GetxController {
  final RxList<Message> messages = <Message>[].obs;
  final _restApi = RestAPI.instance;
  final TextEditingController messageController = TextEditingController();
  final auth = AuthController.instance;
  final Rx<ChatRoom> chatRoom = ChatRoom.empty().obs;
  final Rx<DonationItem> item = DonationItem.test().obs;
  final itemController = DonationItemController.instance;
  final chatController = ChatRoomController.instance;
  late WebSocketChannel channel;
  final canGiveItem = true.obs;
  @override
  void onInit() {
    try {
      final chatRoomId = Get.parameters['id'] ?? '';
      chatRoom(ChatRoom.getFromId(chatRoomId, chatController.chatRooms));
      item(DonationItem.getFromId(
          chatRoom.value.donationId, itemController.donationItems));
      channel = _restApi.getMessageStream(chatRoomId, updateMessages);
      setCanGiveItem();
    } catch (e) {
      log(e.toString());
    }
    super.onInit();
  }

  void setCanGiveItem() {
    if (item.value.author.authorId == auth.userSahara.value.uid!) {
      canGiveItem(true);
    } else {
      canGiveItem(false);
    }
  }

  void updateMessages(List<Message> messageList) {
    messageList.sort((a, b) => a.timeStamp!.compareTo(b.timeStamp!));
    messages(messageList);
  }

  void giveDonation() async {
    if (item.value.deliveryPaidBy == DeliveryPaidBy.donor) {
      Get.toNamed(Routes.payment, parameters: {'id': item.value.donationId!});
    } else if (item.value.deliveryPaidBy == DeliveryPaidBy.both) {
      Get.toNamed(Routes.payment, parameters: {'id': item.value.donationId!});
    } else {
      await _restApi.putReceiverInfo(item.value.donationId!);
    }
  }

  void sendMessage() {
    final chatRoomId = Get.parameters['id'] ?? '';
    final messageText = messageController.text;
    final message = Message(
        message: messageText,
        timeStamp: DateTime.now(),
        senderId: auth.firebaseUser.value!.uid,
        chatRoomId: chatRoomId);
    _restApi.postMessage(message);
    messageController.clear();
  }

  @override
  void onClose() {
    channel.sink.close();
    messageController.dispose();
    super.onClose();
  }
}
