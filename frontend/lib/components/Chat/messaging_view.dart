import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/image_thumbnail.dart';
import 'package:sahara/controllers/chat/message_controller.dart';

class MessagingView extends StatelessWidget {
  final controller = Get.put(MessageController());
  MessagingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Obx(
                  () => ImageThumbnail(
                      imageUrl: controller.item.value.imageUrl,
                      size: 20,
                      isCircular: true),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Obx(
                        () => Text(
                          controller.user.value.userName,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Obx(
                        () => Text(
                          controller.item.value.name,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() => controller.canGiveItem.value
                    ? GiveButton(controller: controller)
                    : Container())
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Obx(
            () => ListView.builder(
              itemCount: controller.messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Obx(
                    () => Align(
                      alignment: (controller.messages[index].senderId !=
                              controller.auth.firebaseUser.value!.uid
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            borderRadius: (controller.messages[index].senderId !=
                              controller.auth.firebaseUser.value!.uid) ? const BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)) : const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: (controller.messages[index].senderId !=
                                    controller.auth.firebaseUser.value!.uid
                                ? Colors.grey.shade200
                                : Colors.blue[200]),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Obx(
                            () => Text(
                              controller.messages[index].message,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Obx(() => controller.letReceiverPay.value
                      ? Row(children: [
                          const Text('You need to pay for delivery fees',
                              style: TextStyle(fontSize: 20)),
                          const SizedBox(width: 10),
                          GiveButton(
                            controller: controller,
                            text: "Pay",
                          )
                        ])
                      : Container()),
                  Obx(() => controller.letReceiverPay.value == false &&
                          controller.isPaymentComplete.value == true
                      ? Row(
                          children: const [
                            Expanded(
                              child: Text(
                                  'Payment for this item is complete! You can check delivery status in delivery tab!',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            ),
                          ],
                        )
                      : Container()),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: controller.messageController,
                          decoration: const InputDecoration(
                              hintText: "Write message...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: controller.sendMessage,
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class GiveButton extends StatelessWidget {
  final String text;
  const GiveButton({
    super.key,
    required this.controller,
    this.text = "Give",
  });

  final MessageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(190, 239, 0, 1),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          disabledForegroundColor: Colors.white,
        ),
        onPressed: () {
          controller.giveDonation();
        },
        child: Text(text, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
