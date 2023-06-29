import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:sahara/components/Feed/upload_address_popup.dart';
import 'package:sahara/models/chat_room.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/models/message.dart';
import 'package:sahara/rest_api.dart';
import 'package:sahara/routes/routes.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../auth/auth_controller.dart';

class ChatRoomController extends GetxController {
  final RxList<ChatRoom> chatRooms = <ChatRoom>[].obs;
  final _auth = AuthController.instance;
  final _restApi = RestAPI.instance;
  final RxList<Message> messages = <Message>[].obs;
  static ChatRoomController get instance => Get.find<ChatRoomController>();
  late WebSocketChannel channel;

  @override
  void onInit() {
    super.onInit();
    initilizeLists();
  }

  void updateMessages(List<Message> messageList) {}

  void initilizeLists() async {
    final chatRoomsUser = await _restApi.getChatRooms();
    chatRooms(chatRoomsUser ?? []);

    // WebSocketChannel channel =
    //     IOWebSocketChannel.connect('ws://${_restApi.host}:${_restApi.wsPort}');
    // for (int i = 0; i < chatRooms.length; i++) {
    //   channel.sink.add('{"chatRoomId": "${chatRooms[i].chatRoomId}"}');
    // }

    // channel.stream.listen((message) {
    //   final List<dynamic> jsonList = json.decode(message);
    //   final List<Message> receivedMessages =
    //       jsonList.map((json) => Message.fromjson(json)).toList();
    //   receivedMessages.sort((a, b) => a.timeStamp!.compareTo(b.timeStamp!));
    //   messages(receivedMessages);
    // });
  }

  void routeToChat(DonationItem item) {
    final user = _auth.userSahara.value;
    if (user.userAddress == null ||
        user.userAddress!.isEmpty ||
        user.userPhoneNumber == null ||
        user.userPhoneNumber!.isEmpty) {
      showUploadAddressDialog(isReciever: true);
    } else {
      joinChatRoom(item);
    }
  }

  void joinChatRoom(DonationItem item) async {
    final chatRoom = ChatRoom(
        authorId: item.author.authorId,
        userId: _auth.firebaseUser.value!.uid,
        donationId: item.donationId!);
    if (existsExisitngChatRoom(chatRoom, chatRooms) != null) {
      Get.toNamed(Routes.chat,
          parameters: {'id': existsExisitngChatRoom(chatRoom, chatRooms)!});
      return;
    }
    final chatRoomId = await _restApi.postChatRoom(chatRoom);
    chatRooms.add(ChatRoom(
        authorId: chatRoom.authorId,
        donationId: chatRoom.donationId,
        userId: chatRoom.userId,
        chatRoomId: chatRoomId));
    Get.toNamed(Routes.chat, parameters: {'id': chatRoomId});
  }

  String? existsExisitngChatRoom(ChatRoom chatRoom, List<ChatRoom> chatRooms) {
    for (final room in chatRooms) {
      if (room.authorId == chatRoom.authorId &&
          room.userId == chatRoom.userId &&
          room.donationId == chatRoom.donationId) {
        return room.chatRoomId!;
      }
    }
    return null;
  }
}
