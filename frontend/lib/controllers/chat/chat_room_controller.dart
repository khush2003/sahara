import 'package:get/get.dart';
import 'package:sahara/models/chat_room.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/rest_api.dart';
import 'package:sahara/routes/routes.dart';

import '../auth/auth_controller.dart';

class ChatRoomController extends GetxController {
  final RxList<ChatRoom> chatRooms = <ChatRoom>[].obs;
  final _auth = AuthController.instance;
  final _restApi = RestAPI.instance;

  static ChatRoomController get instance => Get.find<ChatRoomController>();

  @override
  void onInit() {
    super.onInit();
    initilizeLists();
  }

  void initilizeLists() async {
    final chatRoomsUser = await _restApi.getChatRooms();
    chatRooms(chatRoomsUser ?? []);
  }

  void joinChatRoom(DonationItem item) async {
    final chatRoom = ChatRoom(
        authorId: item.author.authorId,
        userId: _auth.firebaseUser.value!.uid,
        donationId: item.donationId!);
    if (existsExisitngChatRoom(chatRoom, chatRooms) != null){
      Get.toNamed(Routes.chat, parameters: {'id': existsExisitngChatRoom(chatRoom, chatRooms)!});
      return;
    }
    final chatRoomId = await _restApi.postChatRoom(chatRoom);
    chatRooms.add(ChatRoom(authorId: chatRoom.authorId, donationId: chatRoom.donationId, userId: chatRoom.userId, chatRoomId: chatRoomId));
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
