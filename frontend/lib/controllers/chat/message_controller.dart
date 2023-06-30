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
import 'package:sahara/models/payment.dart';
import 'package:sahara/models/user.dart';
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
  final canGiveItem = false.obs;
  final letReceiverPay = false.obs;
  final isPaymentComplete = false.obs;
  final Rx<UserSahara> user = UserSahara.test().obs;
  final Rx<String> chatRoomId = ''.obs;
  @override
  void onInit() {
    try {
      chatRoomId(Get.parameters['id'] ?? '');
      initializeLists();
    } catch (e) {
      //
    }
    super.onInit();
  }

  void initializeLists() {
    chatRoom(ChatRoom.getFromId(chatRoomId.value, chatController.chatRooms));
    item(DonationItem.getFromId(
        chatRoom.value.donationId, itemController.donationItems));
    channel = _restApi.getMessageStream(chatRoomId.value, updateMessages);
    setCanGiveItem();
    checkCondition();
    user(chatController.getUser(chatRoom.value));
  }

  void setCanGiveItem() {
    if (item.value.author.authorId == auth.userSahara.value.uid!) {
      if (item.value.paymentId == null || item.value.paymentId!.isEmpty) {
        canGiveItem(true);
      }
    }
  }

  void checkCondition() async {
    if (item.value.paymentId != null) {
      final Payment payment =
          await _restApi.getPaymentById(item.value.paymentId);
      if (payment.receiverId == auth.userSahara.value.uid!) {
        if (item.value.deliveryPaidBy == DeliveryPaidBy.both) {
          if (payment.paymentImageUrlReceiver == null) {
            letReceiverPay(true);
            isPaymentComplete(false);
          } else {
            letReceiverPay(false);
            isPaymentComplete(true);
          }
        } else if (item.value.deliveryPaidBy == DeliveryPaidBy.receiver) {
          if (payment.paymentImageUrlReceiver == null) {
            letReceiverPay(true);
            isPaymentComplete(false);
          } else {
            letReceiverPay(false);
            isPaymentComplete(true);
          }
        } else {
          letReceiverPay(false);
          isPaymentComplete(true);
        }
      } else {
        if (item.value.deliveryPaidBy == DeliveryPaidBy.both) {
          if (payment.paymentImageUrlReceiver == null) {
            letReceiverPay(true);
            isPaymentComplete(false);
          } else {
            letReceiverPay(false);
            isPaymentComplete(true);
          }
        } else {
          isPaymentComplete(true);
        }
      }
    }
  }

  void updateMessages(List<Message> messageList) {
    messageList.sort((a, b) => a.timeStamp!.compareTo(b.timeStamp!));
    messages(messageList);
  }

  void giveDonation() async {
    if (item.value.deliveryPaidBy == DeliveryPaidBy.donor) {
      routeToPayment();
    } else if (item.value.deliveryPaidBy == DeliveryPaidBy.both) {
      routeToPayment();
    } else {
      if (auth.userSahara.value.uid == chatRoom.value.userId) {
        routeToPayment();
      } else {
        final payment = Payment(
            deliveryPaidBy: item.value.deliveryPaidBy,
            senderId: item.value.author.authorId,
            receiverId: chatRoom.value.userId);
        final paymentId = await _restApi.postPayment(payment);
        await _restApi.putPaymentId(item.value.donationId!, paymentId);
        await itemController.setupLists();
        successSnackBar("Sucessfully Given item!");
      }
    }
  }

  void routeToPayment() {
    Get.toNamed(Routes.payment, parameters: {
      'id': item.value.donationId!,
      'receiverId': chatRoom.value.userId,
    });
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
