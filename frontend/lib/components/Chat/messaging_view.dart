import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/components/image_thumbnail.dart';
import 'package:sahara/controllers/chat/chat_room_controller.dart';
import 'package:sahara/controllers/chat/message_controller.dart';

import '../../routes/routes.dart';

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
                ImageThumbnail(imageUrl: controller.item.value.imageUrl, size: 20, isCircular: true),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Text(
                        controller.item.value.author.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        controller.item.value.name,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(190, 239, 0, 1),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      disabledForegroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.payment);
                    },
                    child: const Text('Give', style: TextStyle(fontSize: 20)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
// iconTheme: IconThemeData(
//     color: Colors.black
//   ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//              Container(
//             width: 30,
//             height: 30,
//             color: Colors.pink,
//           ),
//             Container(width: 200,child: const Text('WaterMelon Sugar', style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis, maxLines: 1,)),
//           ]),
//         actions: [
//           Container(
//             color: const Color.fromRGBO(190, 239, 0, 1),

//             child: TextButton(
//   style: TextButton.styleFrom(
//     foregroundColor: Colors.black,
//     disabledForegroundColor: Colors.white,
//   ),
//   onPressed: () {
//     Get.toNamed(Routes.payment);
//   },
//   child: const Text('Give', style: TextStyle(fontSize: 20)),
// ),
//           )

//         ],
//         ),

      body: Stack(
        children: <Widget>[
          Obx(
            ()=> ListView.builder(
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
                      alignment: (controller.messages[index].senderId != controller.auth.firebaseUser.value!.uid
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (controller.messages[index].senderId != controller.auth.firebaseUser.value!.uid
                                ? Colors.grey.shade200
                                : Colors.blue[200]),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Obx(
                            () => Text(
                              controller.messages[index].message,
                              style: const TextStyle(fontSize: 15),
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
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
            ),
          ),
        ],
      ),
    );
  }
}
